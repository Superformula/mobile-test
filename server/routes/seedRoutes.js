'use strict';
module.exports = function(app) {
  var controller = require('../controllers/seedController');

  app.route('/seed')
    .get(controller.create_seed);
};