const test = require('firebase-functions-test')();
const chai = require('chai');
const assert = chai.assert;

// Our cloud functions.
const functions = require('../lib/index');

describe('Cloud Functions', () => {
    after(() => {
        // Do cleanup tasks.
        test.cleanup();
    });

    describe('seed', () => {
        it('should return a random seed value', (done) => {
            const request = {};
            const response = {
                send: (value) => {
                    assert.equal(value, "Hello from Firebase!");
                    done();
                }
            };

            // Invoke seed with our fake request and response objects.
            functions.seed(request, response);
        });
    });
});

