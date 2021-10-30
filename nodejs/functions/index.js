//Objects init
const functions = require('firebase-functions');
const express = require('express');
const app = express();

//Seed generator function
const generateSeed = s => s.split('').reduce((a,b) => (((a << 5) - a) + b.charCodeAt(0))|0, 0);

//Key generator
var datetime = new Date();
var key = datetime.getUTCHours().toString() + datetime.getUTCMinutes().toString();

//Routes
//Get Seed
app.get("/api/seed",(req,res)=>{

    //Generate a seed based on the current time
    return res.status(200).send({
        "seed": generateSeed(key),
        "time": key
    });
});

//Verify Seed
app.all("/api/verify-seed",(req,res)=>{

    if(req.body.seed!==null){
        if(req.body.seed === generateSeed(key)){
            return res.status(200).send({
                "status": "valid",
            });
        }
        else{
            return res.status(409).send({
                "status": "invalid",
            });
        }
    }
    else{
        return res.status(500).send({
            "error": "Please input a seed value"
        });
    }
});

//Export the app
exports.app = functions.https.onRequest(app);