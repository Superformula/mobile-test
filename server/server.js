const express = require('express');
var app = express();
var port = process.env.PORT || 3000;
bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var routes = require('./routes/seedRoutes'); 
routes(app);

app.listen(port);

console.log('QR Seed RESTful API server started on: ' + port)