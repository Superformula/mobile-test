const ResponseHelper =
  require('./shared/helpers/ResponseHelper.js').ResponseHelper
const RequestHelper = require('./shared/helpers/RequestHelper').RequestHelper
const HTTP_METHODS = require('./shared/constants/HttpMethods')
const Errors = require('./shared/constants/Errors')
const GetHandler = require('./GET')

const handler = async (event) => {
  try {
    const inputs = RequestHelper.parseInputs(event)
    switch (event.httpMethod) {
      case HTTP_METHODS.GET:
        return await GetHandler.handleGETRequest(inputs)
      default:
        return ResponseHelper.createErrorResponse(Errors.METHOD_UNAVAILABLE)
    }
  } catch (err) {
    return ResponseHelper.createErrorResponse(Errors.INTERNAL_SERVER)
  }
}

exports.handler = handler
