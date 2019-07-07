const functions = require("firebase-functions"); // https://firebase.google.com/docs/functions
const crypto = require("crypto"); // https://nodejs.org/api/crypto.html
const moment = require("moment"); // https://momentjs.com/docs/

exports.seed = functions.https.onRequest((request, response) => {
  // Could use Math.random, but Crypto seems better ().

  // Could take length in query parameter, but the client requirements don't suggest
  // a length in the api format, so let's keep it at 32 (example length)
  // (request.query.name_of_the_parameter)
  // Normally, would check with client here, but we're chatting soon.

  // Generate data and return to client
  var randomSeed = crypto.randomBytes(32).toString("hex");
  var expiresAt = moment.utc().add(2, "minute");

  var seed = { seed: randomSeed, expires_at: expiresAt };

  response.status(200).json(seed);
});
