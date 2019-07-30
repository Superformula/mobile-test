const test = require('firebase-functions-test')();
const chai = require('chai');
const assert = chai.assert;
const moment = require('moment');

// Our cloud functions.
const functions = require('../lib/index');

describe('Cloud Functions', () => {
    after(() => {
        // Do cleanup tasks.
        test.cleanup();
    });

    describe('seed', () => {
        it('should return a well formed seed value', (done) => {
            const req = {};
            const res = {
                contentType: (contentType) => {
                    assert.equal(contentType, "application/json");
                },
                send: (bodyText) => {
                    assert.isNotNull(bodyText, "Missing bodyText");

                    // This will throw if bodyText is not well formed json.
                    var data = JSON.parse(bodyText)

                    // Check that there is a 'seed' element in the json and its value has a length of 32 characters.
                    assert.isDefined(data.seed, "JSON missing 'seed' element");
                    assert.lengthOf(data.seed, 32, "Seed string should be 32 characters in length!")

                    // Check that there is an 'expires_at' element in the json and its value is not empty.
                    assert.isDefined(data.expires_at, "JSON missing 'expires_at' element");
                    assert.isNotEmpty(data.expires_at, "Empty expires_at value!")

                    // Check that the 'expires_at' value is a valid ISO_8601 date.
                    var isValidDate = moment(data.expires_at, moment.ISO_8601, true).isValid()
                    assert.isTrue(isValidDate, "Invalid expires_at value!"); // true
                },
                status: (statuscode) => {
                    assert.equal(statuscode, 200);
                },
                end: () => {
                    done();
                },
            };

            // Invoke seed with our fake req and response objects.
            functions.seed(req, res);
        });
    });
});
