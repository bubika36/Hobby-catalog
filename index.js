const express = require("express")
const app = express()
const route = require("./route/route")
const bodyParser = require("body-parser")
const { log } = require("node:console")

app.use("/api", route)
app.use(bodyParser.json())
app.use(express.static("public"))

app.get('/',(req,res)=>{
    res.sendFile(__dirname + '/web/index.html')
})

app.listen(3000, (req,res)=>{
    console.log("A szerver fut http://localhost:3000");
})