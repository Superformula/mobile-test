import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/services/custom_http500_exception.dart';

void main() {
  test('Http500Exception converts to string correctly', () {
    expect(const Http500Exception('test message').toString(),
        'Http500Exception: test message');
    expect(
        Http500Exception(
          'test message 2',
          uri: Uri(path: 'testpath.com'),
        ).toString(),
        'Http500Exception: test message 2, uri = testpath.com');
  });
}
