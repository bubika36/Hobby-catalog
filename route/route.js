const express = require("express")
const router = express.Router()

// Test endpoint: http://localhost:3000/api/test
router.get("/test", (req, res) => {
    res.json({ message: "Az API működik" })
})

module.exports = router
