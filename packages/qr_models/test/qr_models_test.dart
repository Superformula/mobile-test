// ignore_for_file: prefer_const_constructors
import 'package:qr_models/qr_models.dart';
import 'package:test/test.dart';

void main() {
  group('QrModels::', () {
    test('can be instantiated', () {
      const seed = 'any_seed';
      const expiresAt = '2021-09-28';
      expect(QRSeed(seed, expiresAt), isNotNull);
    });

    test('when fromJson is successful, then return a $QRSeed', () {
      const json = {
        'seed': 'any_seed',
        'expiresAt': 'any_time',
      };
      final seed = QRSeed.fromJson(json);
      expect(seed, isNotNull);
      expect(seed.seed, json['seed']);
    });

    test('when toJson is successful, then return a $Map with values', () {
      final seed = QRSeed('seed', 'time');
      final seedJson = seed.toJson();
      expect(seedJson, isNotNull);
      expect(seedJson['seed'], seed.seed);
      expect(seedJson['expiresAt'], seed.expiresAt);
    });

    test('when isExpired returns true', () {
      const seed = 'any_seed';
      const expiresAt = '2001-09-30T16:44:27.196Z';
      final seedModel = QRSeed(seed, expiresAt);

      expect(seedModel.isExpired(), isTrue);
    });
  });
}
