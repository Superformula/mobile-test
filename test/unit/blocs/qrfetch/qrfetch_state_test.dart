import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:test/test.dart';

void main() {
  group("QRFetchState tests to make sure that value comparison works", () {
    final mockSeed = Seed.fromJson({
      "seed": "test",
      "expires_at": "123"
    });

    test("Making sure Equatable has been properly overridden", () {
      expect(const QRLoading(), const QRLoading());
      expect(const QRError(), const QRError());
      expect(QRLoaded(seed: mockSeed, timeLeft: 1),
          QRLoaded(seed: mockSeed, timeLeft: 1));

      expect(const QRLoading(), isNot(const QRError()));
      expect(const QRError(), isNot(QRLoaded(seed: mockSeed, timeLeft: 1)));
    });
  });
}