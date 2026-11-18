// Local settings from .env (see .env.example), loaded before the modules that read them.
// .env is in .gitignore, so everyone keeps their own; without it the defaults in the code are used.
try {
    process.loadEnvFile(__dirname + "/.env")
} catch (error) {
    if (error.code !== "ENOENT") throw error
}

const express = require("express")
const app = express()
const route = require("./route/route")

app.use(express.json())
app.use(express.static(__dirname + "/web"))
app.use("/api", route)

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/web/index.html')
})

app.listen(3000, () => {
    console.log("A szerver fut http://localhost:3000");
})
