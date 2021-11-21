const express = require('express');
const app = express();
const PORT = 8000;

app.use(express.json())
app.listen(
    PORT,
    () => console.log(`it's alive on http://localhost:${PORT}`)
);


app.get('/seed', (req, res) => {

    const currentTime = new Date().getTime();

    // Generates expiration date. Adding 15 seconds to current time
    let expirationTime = currentTime + 15000;

    let expirationDate = new Date(expirationTime).toISOString();

    console.log(`expirationDate = ${expirationDate}`);

    // Generates random seed
    let seedGen = Math.random().toString(36).substr(2, 3) + Math.random().toString(36).substr(2, 3) + Math.random().toString(36).substr(2, 3) + Math.random().toString(36).substr(2, 3) + Math.random(36).toString().substr(2, 4);

    res.status(200).send({
        seed: seedGen,
        description: 'seed generated',
        expires_at: expirationDate,
    });
});


