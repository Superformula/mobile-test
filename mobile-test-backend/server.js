const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('root');
});

const seedRoute = require('./routes/seed');
app.use('/seed', seedRoute);

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

