class AppHttpException implements Exception {
  final String? message;

  AppHttpException([this.message]);
}