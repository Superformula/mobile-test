class LoggingService {
  void information(String message, {String details}) {
    print('INFO: $message, details: ${details ?? "none"}');
  }

  void warning(String message, {String details}) {
    print('WARN: $message, details: ${details ?? "none"}');
  }

  void error(dynamic error) {
    print('ERR: ${error.toString()}');
  }
}
