// Run with: npm test
const test = require("node:test")
const assert = require("node:assert")
const { parseAddress, buildQueries } = require("./geocoder")

test("parseAddress keeps the house number", () => {
    assert.deepStrictEqual(parseAddress("Lövőház u.17."), { street: "Lövőház utca", number: "17" })
    assert.deepStrictEqual(parseAddress("Gyümölcs utca 38. földsz"), { street: "Gyümölcs utca", number: "38" })
    // "Park" is a street type too; the street must not end there
    assert.deepStrictEqual(parseAddress("Park utca 12."), { street: "Park utca", number: "12" })
    // "u." right after an initial
    assert.deepStrictEqual(parseAddress("Wesselényi M.u.100."), { street: "Wesselényi M. utca", number: "100" })
    assert.deepStrictEqual(parseAddress("Kossuth utca 0203/26 hrsz."), { street: "Kossuth utca", number: null })
})

test("the loose search drops one- and two-letter initials", () => {
    const texts = buildQueries({ address: "Dózsa Gy. út 5.", city: "Pécs" }).map((query) => query.text)
    assert.ok(texts.includes("Dózsa 5, Pécs"), texts.join(" | "))
    const texts2 = buildQueries({ address: "Wesselényi M.u.100.", city: "Győr" }).map((query) => query.text)
    assert.ok(texts2.includes("Wesselényi 100, Győr"), texts2.join(" | "))
})
