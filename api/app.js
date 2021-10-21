const express = require('express');
const app = express();
const { 
    v4: uuidv4,
  } = require('uuid');

app.use(express.json());

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listenning on port ${port}`));

app.get('/api/seed', (req, res) => {
    var expirationDate = new Date();
    expirationDate.setSeconds( expirationDate.getSeconds() + 20 );

    res.send({
        "seed": uuidv4(),
        "expires_at": expirationDate.toISOString()
    });
});
