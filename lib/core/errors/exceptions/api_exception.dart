final class ApiException implements Exception {
  const ApiException({
    required this.message,
    required this.error,
    required this.stackTrace,
  });
  final String message;
  final Object error;
  final StackTrace stackTrace;
}
