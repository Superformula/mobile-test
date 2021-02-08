'use strict';

exports.create_seed = function(req, res) {
    
    var dt = new Date();
    dt.setSeconds(dt.getSeconds() + 15);
    res.setHeader('Content-Type', 'application/json');
    
    res.end(JSON.stringify({ 
        seed: Math.floor((Math.random() * 1000000) + 1),
        dateTime: dt.toISOString(),
     }));
  
  };