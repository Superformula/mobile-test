let crypto = require('crypto');
let moment = require('moment');

let proto = {
  seeds: {},
  makeSeed(length) {
    console.debug('Generating seed');
    let data = crypto.randomBytes(length).toString('hex');
    let expiresAt = moment.utc().add(15, 'seconds').format()

    let seed = {
      seed: data,
      expires_at: expiresAt
    }

    this.seeds[data] = seed;
    console.log(this.seeds);
    return seed;
  }
}

const inMemorySeedRepoFactory = () => {
  return Object.assign({}, proto);
}

module.exports = inMemorySeedRepoFactory;