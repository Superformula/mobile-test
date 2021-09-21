const Errors = require('./shared/constants/Errors');
const cryptoRandomString = require('crypto-random-string');
const ResponseHelper =
  require('./shared/helpers/ResponseHelper').ResponseHelper;

const ALLOWED_CHARS =
  'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
const TOKEN_LENGHT = 32;

async function handleGETRequest(inputs) {
  try {
    const response = {
      seed: cryptoRandomString({
        length: TOKEN_LENGHT,
        characters: ALLOWED_CHARS,
      }),
      expires_at: new Date(new Date().getTime() + 1 * 60000).toISOString(),
      // expire_at: new Date().toISOString(),
    };

    return ResponseHelper.createSuccessResponse(response);
  } catch (error) {
    console.log(error);
    throw new Error(Errors.INTERNAL_SERVER.message);
  }
}

module.exports = {
  handleGETRequest,
};
