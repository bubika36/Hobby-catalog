const express = require("express")
const controller = require("../controller/controller")
const router = express.Router()

// Test endpoint: http://localhost:3000/api/test
router.get("/categories", controller.allCategories)
router.get("/clubs", controller.allClubs)
router.get("/clubs/:id/location", controller.clubLocation)

module.exports = router
