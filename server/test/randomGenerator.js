'use strict';
const expect  = require("chai").expect;
const generator = require('../utils/randomGenerator');

describe("Random Seed Generator", function() {
    it("generates by length", function() {
        var seed = generator.genSeed(20);
        expect(seed.length).to.equal(20);
    });
    it("generates lowercase", function() {
        var seed = generator.genSeed(20);
        expect(seed).to.equal(seed.toLowerCase());
    });
  });