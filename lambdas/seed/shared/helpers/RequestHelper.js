/**
 * A collection of helper methods that can parse or validate request inputs.
 */
class RequestHelper {
  /**
   * Returns the parsed inputs from the request event.
   *
   * @param {any} event The request event from the APIGateway.
   * @returns {RequestInput}
   */
  static parseInputs (event) {
    return {
      body: event.body,
      queryParameters: event.queryStringParameters
    }
  }

  /**
   * Checks the received service against the invoked service and throws an error
   * if they don't match.
   *
   * @param {string} receivedService The service identifier send to the Lambda function.
   * @param {string} invokedService The actual service that was invoked.
   * @throws {Error}
   */
  static checkServiceName (receivedService, invokedService) {
    if (receivedService !== invokedService) {
      throw new Error(
        `Wrong endpoint invoked for the service : "${receivedService}"`
      )
    }
  }
}

exports.RequestHelper = RequestHelper
