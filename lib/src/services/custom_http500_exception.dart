import 'dart:io';

class Http500Exception implements HttpException {
  const Http500Exception(this.message, {this.uri});
  @override
  final String message;
  @override
  final Uri uri;

  @override
  String toString() {
    final StringBuffer b = StringBuffer()
      ..write('Http500Exception: ')
      ..write(message);
    final Uri uri = this.uri;
    if (uri != null) {
      b.write(', uri = $uri');
    }
    return b.toString();
  }
}
