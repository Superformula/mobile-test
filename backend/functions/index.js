const functions = require('firebase-functions');
const dayjs = require('dayjs');

const SEED_LENGTH = 32

// https://stackoverflow.com/a/14249522/1048340
function randomString(length, charSet) {
  var result = [];
  length = length || 32;
  charSet = charSet || 'abcdefghijklmnopqrstuvwxyz0123456789';
  while (length--) {
    result.push(charSet.charAt(Math.floor(Math.random() * charSet.length)));
  }
  return result.join('');
}

function expirtedAt() {
  return dayjs().add(1, 'minute')
}

exports.seed = functions.https.onRequest((request, response) => {
  var seed = randomString(SEED_LENGTH)
  var expired_at = expirtedAt().toISOString()
  response.status(200).send(JSON.stringify({
    "seed": seed,
    "expired_at": expired_at
  }))
});
