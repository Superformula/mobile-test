'use strict';
module.exports = function(app) {
  var controller = require('../controller.js');

  app.route('/seed')
    .get(controller.generateSeed);

};
