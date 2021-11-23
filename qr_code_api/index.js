const express = require('express');
const app = express();
const PORT = 8080;

app.listen(
    PORT,
    () => console.log(`it's alive on http://localhost:${PORT}`)
)


function makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * 
 charactersLength));
   }
   return result;
}

function getTime(){
    var minutesToAdd=1;
    var currentDate = new Date();
    var futureDate = new Date(currentDate.getTime() + minutesToAdd*60000);
    return futureDate;
}

app.use( express.json() )

app.get('/seed', (req,res) =>{
    res.status(200).send({
        seed: makeid(32),
        expires_at: getTime()
    })
})