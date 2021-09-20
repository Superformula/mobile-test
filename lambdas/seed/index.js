const ResponseHelper =
  require('./shared/helpers/ResponseHelper.js').ResponseHelper;
const RequestHelper = require('./shared/helpers/RequestHelper').RequestHelper;
const HTTP_METHODS = require('./shared/constants/HttpMethods');
const GetHandler = require('./GET');

const handler = async (event) => {
  try {
    const inputs = parseInputs(event);
    switch (event.httpMethod) {
      case HTTP_METHODS.GET:
        return await GetHandler.handleGETRequest(inputs);
      default:
        return createResponse(
          new Error(`Unsupported method "${event.httpMethod}"`)
        );
    }
  } catch (err) {
    console.log('ERROR CAPTURED', err);
    return ResponseHelper.createErrorResponse(err);
  }
};

function parseInputs(event) {
  return RequestHelper.parseInputs(event);
}

function createResponse(err, res) {
  return ResponseHelper.createResponse(err, res);
}

exports.handler = handler;
