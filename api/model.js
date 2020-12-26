'use strict';
var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var SeedSchema = new Schema({
  seed: {
    type: String,
    required: true
  },
  expires_at: {
    type: Date,
    required: true
  },
});

module.exports = mongoose.model('Seeds', SeedSchema);
