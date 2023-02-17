class DataSourceException implements Exception {
  final Object error;
  final String message;

  const DataSourceException({
    required this.error,
    required this.message,
  });
}
