let express = require('express');
let bodyParser = require('body-parser');
let routes = require('./routes/routes.js');
let seedRepo = require('./repositories/inMemorySeedRepository')
let app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

routes(app, seedRepo());

let server = app.listen(3000, function () {
  console.log("app running on port.", server.address().port);
});