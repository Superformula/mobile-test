var express = require('express'),
  app = express(),
  mongoose = require('mongoose'),
  Seed = require('./model'),
  port = process.env.PORT || 3000;

var routes = require('./routes');
routes(app);

app.listen(port);

console.log('API server started on port ' + port);
