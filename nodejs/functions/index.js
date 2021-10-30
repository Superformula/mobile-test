//Objects init
const functions = require('firebase-functions');
const express = require('express');
const app = express();

//Routes
//Get Seed
app.get("/api/seed",(req,res)=>{
    return res.status(200).send({
        "seed": "",
        "time": ""
    });
});

//Verify Seed
app.all("/api/verify-seed",(req,res)=>{
    return res.status(200).send({
        "seed": "",
    });
});

//Export the app
exports.app = functions.https.onRequest(app);