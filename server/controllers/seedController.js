'use strict';
const generator = require('../utils/randomGenerator');

exports.create_seed = function(req, res) {
    
    var dt = new Date();
    dt.setSeconds(dt.getSeconds() + 15);
    res.setHeader('Content-Type', 'application/json');
    
    res.end(JSON.stringify({ 
        seed: generator.genSeed(40),
        dateTime: dt.toISOString(),
     }));
  
  };