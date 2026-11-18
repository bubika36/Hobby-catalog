const model = require("../modell/modell")
const geocoder = require("../modell/geocoder")

exports.allCategories = async (req, res) => {
    try {
        const categories = await model.allCategories()
        res.json(categories)
    } catch (error) {
        console.error(error)
        res.status(404).json({ error: "No records found!" })
    }
}

exports.allClubs = async (req, res) => {
    try {
        const clubs = await model.allClubs()
        res.json(clubs)
    } catch (error) {
        console.error(error)
        res.status(404).json({ error: "No records found!" })
    }
}

// The club's coordinates for the map: { lat, lng, precision }
exports.clubLocation = async (req, res) => {
    // only whole numbers: Number("abc") is NaN and Number("1e999") is Infinity, which break the SQL
    if (!/^\d{1,9}$/.test(req.params.id)) return res.status(400).json({ error: "Invalid club id!" })
    try {
        const club = await model.clubAddress(Number(req.params.id))
        if (!club) return res.status(404).json({ error: "Club not found!" })
        const location = await geocoder.geocodeClub(club)
        if (!location) return res.status(404).json({ error: "Address not found on the map!" })
        res.json(location)
    } catch (error) {
        console.error(error)
        res.status(502).json({ error: "Geocoding failed!" })
    }
}