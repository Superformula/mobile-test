// ignore_for_file: prefer_const_constructors
import 'package:qr_models/qr_models.dart';
import 'package:test/test.dart';

void main() {
  group('QrModels', () {
    test('can be instantiated', () {
      const seed = 'any_seed';
      const expiresAt = '2021-09-28';
      expect(QRSeed(seed, expiresAt), isNotNull);
    });
  });
}
