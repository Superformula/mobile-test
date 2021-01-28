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
          'expires_at': '2000-01-01 12:34:12.456',
        }),
        throwsAssertionError,
      );
    });

    test('seed should not be undefined', () {
      expect(
        () => QRCodeMapper.fromMap({
          'expires_at': '2000-01-01 12:34:12.456',
        }),
        throwsAssertionError,
      );
    });

    test('expires_at should not allow null value', () {
      expect(
        () => QRCodeMapper.fromMap({
          'seed': 'text',
          'expires_at': null,
        }),
        throwsAssertionError,
      );
    });

    test('expires_at should not undefined', () {
      expect(
        () => QRCodeMapper.fromMap({
          'seed': 'text',
        }),
        throwsAssertionError,
      );
    });

    test('expires_at should be valid', () {
      expect(
        () => QRCodeMapper.fromMap({
          'seed': 'text',
          'expires_at': 'invalid',
        }),
        throwsAssertionError,
      );
    });

    test('QRCode should be correctly mapped', () {
      final expectedSeed = 'seedText';
      final expectedExpiration = '2012-02-27 13:27:12.456';

      var map = {
        'seed': expectedSeed,
        'expires_at': expectedExpiration,
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
        'expires_at': expectedExpiration,
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
