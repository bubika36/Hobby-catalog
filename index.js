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
