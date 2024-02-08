const express = require('express');
const randomstring = require("randomstring");
const router = express.Router();

router.get('/', (req, res) => {
    const tzoffset = (new Date()).getTimezoneOffset() * 60000;
    const localISOTime = (new Date(Date.now() - tzoffset));
    localISOTime.setMinutes(localISOTime.getMinutes() + 1);
    const expires_at = localISOTime.toISOString().slice(0, -1);
    const seed = randomstring.generate();
    res.json({'seed': seed, 'expires_at': expires_at});
});

module.exports = router;