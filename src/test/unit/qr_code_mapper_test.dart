import 'package:flutter_test/flutter_test.dart';
import 'package:qrcodevalidator/data/mappers/qr_code_mapper.dart';
import 'package:qrcodevalidator/domain/entities/qr_code.dart';

void main() {
  group('QRCode mapper', () {
    test('Map object should not allow null value', () {
      expect(
        () => QRCodeMapper.fromMap(null),
        throwsAssertionError,
      );
    });

    test('seed should not allow null value', () {
      expect(
        () => QRCodeMapper.fromMap({
          'seed': null,
          'expiresAt': '2000-01-01 12:34:12.456',
        }),
        throwsAssertionError,
      );
    });

    test('seed should not be undefined', () {
      expect(
        () => QRCodeMapper.fromMap({
          'expiresAt': '2000-01-01 12:34:12.456',
        }),
        throwsAssertionError,
      );
    });

    test('expiresAt should not allow null value', () {
      expect(
        () => QRCodeMapper.fromMap({
          'seed': 'text',
          'expiresAt': null,
        }),
        throwsAssertionError,
      );
    });

    test('expiresAt should not undefined', () {
      expect(
        () => QRCodeMapper.fromMap({
          'seed': 'text',
        }),
        throwsAssertionError,
      );
    });

    test('expiresAt should be valid', () {
      expect(
        () => QRCodeMapper.fromMap({
          'seed': 'text',
          'expiresAt': 'invalid',
        }),
        throwsAssertionError,
      );
    });

    test('QRCode should be correctly mapped', () {
      final expectedSeed = 'seedText';
      final expectedExpiration = '2012-02-27 13:27:12.456';

      var map = {
        'seed': expectedSeed,
        'expiresAt': expectedExpiration,
      };

      var qrCode = QRCodeMapper.fromMap(map);

      expect(qrCode.seed, expectedSeed);
      expect(qrCode.expiresAt, DateTime.parse(expectedExpiration));
    });

    test('map should be valid', () {
      final expectedSeed = 'seedText';
      final expectedExpiration = '2012-02-27 13:27:12.456';

      var expectedMap = {
        'seed': expectedSeed,
        'expiresAt': expectedExpiration,
      };

      expect(
        QRCodeMapper.toMap(
          QRCode(
            seed: expectedSeed,
            expiresAt: DateTime.parse(expectedExpiration),
          ),
        ),
        expectedMap,
      );
    });
  });
}
