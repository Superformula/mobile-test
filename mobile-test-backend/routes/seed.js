const express = require('express');
const randomstring = require("randomstring");
const router = express.Router();

router.get('/', (req, res) => {
    const dateNowMilliseconds = Date.now();
    const date = new Date(dateNowMilliseconds);
    var formattedDate = date.toISOString().replace('Z', '')
    const seed = randomstring.generate();
    res.json({'seed': seed, 'expires_at': formattedDate});
});

module.exports = router;