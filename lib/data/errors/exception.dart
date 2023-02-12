class DataSourceException implements Exception {
  final Object error;
  final String message;

  DataSourceException({
    required this.error,
    required this.message,
  });
}
