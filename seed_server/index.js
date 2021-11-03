const { randomBytes } = require('crypto');

const express = require('express');

// Type checking functions for checking data values
function isObject(val) {
  return typeof val === 'object' && !Array.isArray(val);
}

function isString(val) {
  return typeof val === 'string';
}

// Simple class for keeping track of Seed information.
class Seed {
  constructor(seed, expiration) {
    this.seed = seed;
    this.expiration = expiration;
  }

  isValid(date) {
    if (!(date instanceof Date)) {
      return false;
    }

    var time = date.getTime();
    var exp = this.expiration.getTime();

    return exp > time;
  }
}

// In-memory data store.
let seeds = {};

// This function runs every minute to clear out invalid seeds.
function clearSeeds() {
  const now = new Date();
  Object.values(seeds).forEach((seed) => {
    if (!seed.isValid(now)) {
      delete seeds[seed.seed];
    }
  });

  setTimeout(() => clearSeeds(), 60 * 1000);
}

// Kick off the clearSeeds function
clearSeeds();

// Body parser
const app = express();
app.use(express.json());

// GET /route to generate a random seed, save it to the seeds object
// and return the data as JSON value.
app.get('/', function(req, res) {
  const buf = randomBytes(32);
  const now = new Date();
  const oneMinuteLater = new Date(now.getTime() + 60 * 1000);

  const seed = new Seed(buf.toString('hex'), oneMinuteLater);

  seeds[seed.seed] = seed;

  res.json({
    seed: seed.seed,
    expires_at: seed.expiration.toISOString(),
  });
});

// POST /validate route to compare the received seed against those
// saved in-memory. Returns a 200 response if the seed is still valid
// 400 if the body is invalid and 401 if the seed is not valid.
app.post('/validate', function(req, res) {
  const body = req.body;

  // If the body is not an object or seed is not a string, the request is malformed
  if (!isObject(body)
    || !isString(body.seed)
  ) {
    res.sendStatus(400);
    return;
  }

  // We retrieve the seed from the seeds object
  const retrievedSeed = seeds[body.seed];
  const now = new Date();

  // We check that the seed has been retrieved and that it's still valid.
  if (!isObject(retrievedSeed) || !retrievedSeed.isValid(now)) {
    // 401 unauthorized means that the seed is NOT valid
    res.sendStatus(401);
    return;
  }

  // 200 means that the seed is valid.
  res.sendStatus(200);
});

app.listen(80, () => console.log('Running the server on port 80'));