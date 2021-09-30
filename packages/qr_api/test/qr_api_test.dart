// ignore_for_file: prefer_const_constructors
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_api/qr_api.dart';
import 'package:test/test.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('QrApi::', () {
    test('can be instantiated', () {
      expect(QrApi(MockDio()), isNotNull);
    });
  });
}
