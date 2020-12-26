'use strict';
var randomWords = require('random-words');

var mongoose = require('mongoose'),
  Seed = mongoose.model('Seeds');

exports.generateSeed = function(req, res) {
  let word = randomWords();
  let expiresAt = Date.now() + 30 * 1000; // Expires in 30 seconds

  let seed = new Seed({seed: word, expires_at: expiresAt});

  res.send(seed);
};

