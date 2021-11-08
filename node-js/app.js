const express = require('express');
var fs = require("fs");

const app = express();

app.get('/',(req,res) => {
    res.send("Welcome");
})

//Routes
app.get('/users',(req,res) => {
    fs.readFile( __dirname + "/" + "file.json", 'utf8', function (err, data) {
        var botNames = JSON.parse(data)
        const keys = Object.keys(botNames)
        const randIndex = Math.floor(Math.random() * keys.length)
        const randKey = keys[randIndex]
        const name = botNames[randKey]
        console.log(name);
        res.send( name);
     });
} )

app.listen(3000);