class CustomException implements Exception {
  CustomException([this.message, this.prefix]);
  final String message;
  final String prefix;
}

class FetchDataException extends CustomException {
  FetchDataException([String message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends CustomException {
  BadRequestException([String message]) : super(message, 'Invalid Request: ');
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String message]) : super(message, 'Unauthorised: ');
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message]) : super(message, 'Invalid Input: ');
}
