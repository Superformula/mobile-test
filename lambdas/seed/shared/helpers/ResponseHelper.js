const DEFAULT_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': '*',
  'Content-Type': 'application/json'
}

/**
 * The ResponseHelper contains methods for properly returning data from the
 * HTTP request.
 */
class ResponseHelper {
  /**
   * Constructs the ERROR response object that each Lambda function needs to return.
   *
   * @param { object } err { statusCode: string, message: string}
   */
  static createErrorResponse (err) {
    return {
      statusCode: err.statusCode, // default status code
      body: err.message ? JSON.stringify({ message: err.message }) : null,
      headers: DEFAULT_HEADERS
    }
  }

  /**
   * Constructs the response object that each Lambda function needs to return.
   * @param {res} res The response body that shall be returned in case of success.
   */
  static createSuccessResponse (res) {
    return {
      statusCode: '200',
      body: JSON.stringify(res),
      headers: DEFAULT_HEADERS
    }
  }
}

exports.ResponseHelper = ResponseHelper
