const functions = require('firebase-functions');
const uuid = require('uuid');
const moment = require('moment');
const express = require('express');

// setup basic express app to handle HTTPS requests.
// api location: https://us-central1-qr-scanner-a71db.cloudfunctions.net/api/seed

const app = express();

app.get('/seed', (req, res) => {
  res.status(200).json({
    seed: uuid.v4(),
    expires_at: moment().add(15, 'minutes').toISOString(),
  });
});

exports.api = functions.https.onRequest(app);