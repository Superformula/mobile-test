class HttpError extends Error {
  HttpError({
    this.url,
    this.code,
    this.message,
    this.details,
  });
  final String url;
  final int code;
  final String message;
  final String details;

  @override
  String toString() {
    return 'url: $url,code: $code, message: $message, details: $details';
  }
}
