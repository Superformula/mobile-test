// ignore_for_file: prefer_const_constructors
import 'package:domain_models/domain_models.dart';
import 'package:test/test.dart';

void main() {
  group('QrCode', () {
    QrCode createSubject({
      String seed = '2319818hdhdh12922',
      DateTime? expiresAt,
    }) {
      return QrCode(
        seed: seed,
        expiresAt: expiresAt ?? DateTime.tryParse('1979-11-12T13:10:42.24Z'),
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(createSubject, returnsNormally);
      });

      test('supports value equality', () {
        expect(
          createSubject(),
          equals(createSubject()),
        );
      });
    });
  });
}
