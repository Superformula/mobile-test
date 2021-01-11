var express = require("express");
const bodyParser = require('body-parser');
const { v4: uuidv4 } = require('uuid');


var app = express();

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
//app.use(bodyParser.json());
var seedObj; 

// get seed with expiration time of 1 min from now
app.get("/seed", (req, res, next) => {
    var seed = uuidv4();
    var expiresAt = new Date();
    expiresAt.setMinutes( expiresAt.getMinutes() + 1);
    seedObj = {seed, expiresAt} 
    res.status(200).json(seedObj);
   });

app.post('/validate', (req, res) => {
    console.log('Got body:', req.body);
  //  console.log('got', req.body['seed']);
   // console.log('got', req.body['expiresAt']);
    var validated = false;
    
    if(req.body['seed'] === seedObj.seed) {
        validated = true;
    }
    if(!validated){
        res.status(200).json({'status': 'invalid'});    
    }    
    else {
        var dt = new Date();
        console.log('time compare:', dt.getTime(), seedObj.expiresAt.getTime());
        if(dt.getTime() > seedObj.expiresAt.getTime()){
            res.status(200).json({'status': 'expired'}); 
        }
        else{
            res.status(200).json({'status': 'valid'});   
        }
        
    }
    
});  

app.listen(3000, () => {
 console.log("Server running on port 3000");
});