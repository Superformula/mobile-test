import 'package:qr_generator_api/qr_generator_api.dart';
import 'package:test/test.dart';

void main() {
  group('QrCodeRM', () {
    group('fromJson', () {
      test('return correct QrCodeRM object', () {
        expect(
          QrCodeRM.fromJson(<String, dynamic>{
            'seed': '1232ddad29204',
            'expires_at': '1979-11-12T13:10:42.24Z'
          }),
          isA<QrCodeRM>(),
        );
      });
    });
  });
}
