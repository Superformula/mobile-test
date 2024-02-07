final class QrCodeException implements Exception {
  const QrCodeException({
    required this.message,
    required this.error,
    required this.stackTrace,
  });
  final String message;
  final Object error;
  final StackTrace stackTrace;
}
