const {v4: uuid} = require("uuid");
const {DateTime} = require("luxon");

const express = require("express");
const app = express();
const port = 3000;

app.get("/seed", (request, response) => {
    const seed = uuid();
    const expiresAt = DateTime.now().plus({seconds: 30}).toUTC();
    response.json({seed, expires_at: expiresAt});
});

app.listen(port, () => `qr-generator-api started on port ${port}`);
