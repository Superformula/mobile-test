/* eslint-disable no-magic-numbers */

const NOT_FOUND = {
  statusCode: 404,
  message: 'Resource not found',
};

const METHOD_UNAVAILABLE = {
  statusCode: 400,
  message: 'Unsupported method',
};

const EXTERNAL_SERVICE = {
  statusCode: 404,
  message: 'Resource not found',
};

const INTERNAL_SERVER = {
  statusCode: 500,
  message: 'Internal server error',
};

module.exports = {
  NOT_FOUND,
  METHOD_UNAVAILABLE,
  INTERNAL_SERVER,
  EXTERNAL_SERVICE,
};
