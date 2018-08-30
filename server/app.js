const express = require("express");
const app = express();
const crypto = require("crypto");

let port = process.env.port || 3000;

app.listen(port, () => {
    console.log(`Listening on port ${port}`)
});

app.get("/seed", (req, res, error) => {

    let json = {};

    json.seed = crypto.createHash("sha1").update(crypto.randomBytes(64)).digest("hex");
    json.expires_at = getExpirationDate().toISOString();

    res.json(json);
});

app.post("/seed", (req, res, error) => {
    res.json({valid: false})
});

function getExpirationDate() {
    let date = new Date().getTime();
    //set expiration to 10s
    date += 10000;
    return new Date(date);
}