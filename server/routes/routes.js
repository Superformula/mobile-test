let crypto = require('crypto');
let moment = require('moment');

let makeSeed = (length) => {
  let seed = crypto.randomBytes(length).toString('hex');
  let expiresAt = moment.utc().add(15, 'seconds').format()

  return {
    seed,
    expires_at: expiresAt
  }
}

let appRouter = (app) => {
  app.get("/seed", (req, res) => {
    console.debug('Generating seed');
    res.status(200).send(makeSeed(20));
  });
}

module.exports = appRouter;