let crypto = require('crypto');
let moment = require('moment');

let proto = {
  seeds: {},
  makeSeed(length) {
    console.debug('Generating seed');
    let data = crypto.randomBytes(length).toString('hex');
    let expiresAt = moment.utc().add(1, 'minute').format()

    let seed = {
      seed: data,
      expires_at: expiresAt
    }

    this.seeds[data] = seed;

    return seed;
  },
  validateCode(data) {
    let seed = this.seeds[data];

    if (seed) {
      let seedExpirationMoment = moment(seed.expires_at);
      let now = moment().utc();
      return now.isBefore(seedExpirationMoment);
    } else {
      throw new Error('Seed not found');
    }
  }
}

const inMemorySeedRepoFactory = () => {
  return Object.assign({}, proto);
}

module.exports = inMemorySeedRepoFactory;