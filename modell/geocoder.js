// Turns a club's address into coordinates with Nominatim (OpenStreetMap's geocoder).
// Nominatim's usage policy (https://operations.osmfoundation.org/policies/nominatim/):
//  - at most 1 request per second -> requests wait for each other
//  - results must be cached       -> geocode-cache.json, so every address is looked up only once
//  - an identifying User-Agent    -> GEOCODER_USER_AGENT in .env (see .env.example)
const fs = require("fs/promises")
const path = require("path")

const NOMINATIM_URL = "https://nominatim.openstreetmap.org/search"
const USER_AGENT = process.env.GEOCODER_USER_AGENT || "club-map-geocoder/1.0"
if (!process.env.GEOCODER_USER_AGENT) {
    console.warn("GEOCODER_USER_AGENT is not set (see .env.example): the map's address lookups use a generic User-Agent, which Nominatim may throttle.")
}
const CACHE_FILE = path.join(__dirname, "..", "geocode-cache.json")
const MIN_DELAY_MS = 1100

// ---------- cache: "address|zipCode|city" -> { lat, lng, precision }, or null if not found ----------

let cachePromise = null
const getCache = () => {
    cachePromise ??= fs
        .readFile(CACHE_FILE, "utf8")
        .then((text) => new Map(Object.entries(JSON.parse(text))))
        .catch(() => new Map())
    return cachePromise
}

const saveCache = (cache) =>
    fs.writeFile(CACHE_FILE, JSON.stringify(Object.fromEntries(cache), null, 2) + "\n")

// ---------- Nominatim requests, one at a time, at least MIN_DELAY_MS apart ----------

let queue = Promise.resolve()
let lastRequestAt = 0

// "Székesfehérvár" and "Szekesfehervar" are the same town.
const normalizeName = (name) => name.normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase().trim()

// The parts of a result's address that name the settlement it is in. A district counts too:
// Pétfürdő is part of Várpalota in OpenStreetMap. The county does not: "Veszprém" also
// matches Veszprém megye, where a street with the same name can be in another village.
const PLACE_FIELDS = ["city", "town", "village", "municipality", "city_district", "suburb", "hamlet"]

const isInCity = (result, city) =>
    PLACE_FIELDS.some((field) => result.address?.[field] && normalizeName(result.address[field]) === normalizeName(city))

// The first result of the search that is in the given town, or null.
const search = (query, city) => {
    const request = queue.then(async () => {
        const wait = lastRequestAt + MIN_DELAY_MS - Date.now()
        if (wait > 0) await new Promise((resolve) => setTimeout(resolve, wait))
        lastRequestAt = Date.now()

        const params = new URLSearchParams({ q: query, format: "jsonv2", limit: "5", addressdetails: "1", countrycodes: "hu" })
        const response = await fetch(`${NOMINATIM_URL}?${params}`, {
            headers: { "User-Agent": USER_AGENT, "Accept-Language": "hu" },
            signal: AbortSignal.timeout(15000),
        })
        if (!response.ok) throw new Error(`Nominatim HTTP ${response.status}`)
        const result = (await response.json()).find((item) => isInCity(item, city))
        return result ? { lat: Number(result.lat), lng: Number(result.lon) } : null
    })
    queue = request.catch(() => {}) // a failed request must not block the ones after it
    return request
}

// ---------- address -> search texts, from the most to the least precise ----------

const STREET_TYPES = new Set([
    "utca", "út", "útja", "tér", "köz", "sor", "fasor", "sétány", "körút",
    "lakótelep", "lakónegyed", "park", "dűlő", "tanya", "part", "rakpart",
])

// "Lövőház u.17." -> { street: "Lövőház utca", number: "17" }
// "Gyümölcs utca 38. földsz" -> { street: "Gyümölcs utca", number: "38" } (floor, door etc. are dropped)
const parseAddress = (address) => {
    const hasParcelNumber = /hrsz/i.test(address) // "0203/26 hrsz." is a land registry number, not a house number
    const tokens = address
        .replace(/hrsz\.?/gi, " ")
        .replace(/(^|\s)u\.\s*/g, "$1utca ")
        .replace(/(^|\s)ltp\.\s*/g, "$1lakótelep ")
        .split(/\s+/)
        .filter(Boolean)

    const isStreetType = (token) => token === "u" || STREET_TYPES.has(token.replace(/[.,]+$/, "").toLowerCase())
    let end = tokens.findIndex(isStreetType) // the street name ends with its type ("Budai út")
    if (end === -1) end = tokens.findIndex((token) => /^\d/.test(token)) - 1 // or right before the number
    if (end < 0) return { street: tokens.join(" "), number: null }

    const street = tokens.slice(0, end + 1).map((token) => (token === "u" ? "utca" : token)).join(" ")
    const number = hasParcelNumber ? null : (tokens[end + 1]?.match(/^\d+/)?.[0] ?? null)
    return { street, number }
}

// The data often has the wrong street type ("Csíkvári u." for Csíkvári út) or initials
// ("Wesselényi M. u." for Wesselényi Miklós utca), which OpenStreetMap does not match.
// So every search is tried a second time with only the name: "Csíkvári", "Wesselényi".
const looseStreetName = (street) =>
    street
        .split(" ")
        .filter((token) => !STREET_TYPES.has(token.toLowerCase()) && !/^\p{Lu}\.$/u.test(token))
        .join(" ")

const buildQueries = ({ address, city }) => {
    const { street, number } = parseAddress(address)
    const loose = street ? looseStreetName(street) : ""
    const streets = [...new Set([street, loose].filter(Boolean))]
    return [
        ...(number ? streets.map((name) => ({ text: `${name} ${number}, ${city}`, precision: "address" })) : []),
        ...streets.map((name) => ({ text: `${name}, ${city}`, precision: "street" })),
        { text: city, precision: "city" },
    ]
}

// ---------- public ----------

const pending = new Map() // the same address requested twice at once is looked up only once

// club: { address, zipCode, city } -> { lat, lng, precision: "address" | "street" | "city" } or null
const geocodeClub = async (club) => {
    const key = `${club.address}|${club.zipCode}|${club.city}`
    const cache = await getCache()
    if (cache.has(key)) return cache.get(key)
    if (pending.has(key)) return pending.get(key)

    const lookup = (async () => {
        let location = null
        for (const query of buildQueries(club)) {
            const result = await search(query.text, club.city) // network errors are thrown and not cached
            if (result) {
                location = { ...result, precision: query.precision }
                break
            }
        }
        cache.set(key, location) // "not found" is cached too, so it is not asked again
        await saveCache(cache)
        return location
    })()

    pending.set(key, lookup)
    try {
        return await lookup
    } finally {
        pending.delete(key)
    }
}

module.exports = { geocodeClub, parseAddress }
