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
      return false;
    }
  }
}

// QR Codes for testing
let intialSeeds = {
  '9d0cb7083d667d5392444f9c0fd2b7632d26c2a0': { // Invalid QR Code
    seed: '9d0cb7083d667d5392444f9c0fd2b7632d26c2a0',
    expires_at: '2018-05-08T18:50:18Z'
  },
  '3aacdcaf3f88f81d347cc23ae1929d576dc7450d' : { // Valid QR Code
    seed: '3aacdcaf3f88f81d347cc23ae1929d576dc7450d',
    expires_at: '2222-05-08T18:49:19Z'
  }
};


const inMemorySeedRepoFactory = () => {
  return Object.assign({}, proto, {seeds: intialSeeds});
}

module.exports = inMemorySeedRepoFactory;