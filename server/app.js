const express = require("express");
const app = express();
const crypto = require("crypto");

let port = process.env.port || 3000;

app.listen(port, () => {
    console.log(`Listening on port ${port}`)
});

app.get("/seed", (req, res, error) => {

    let json = {};
    //This is very generic and not so secure.  For an actual production app, probably want to use better security
    json.seed = crypto.createHash("sha1").update(getExpirationDate().toISOString()).digest("hex");
    json.expires_at = getExpirationDate().toISOString();

    res.json(json);
});

function getExpirationDate() {
    let date = new Date().getTime();
    //add an hour
    date += (60 * 60 * 1000);
    return new Date(date);
}