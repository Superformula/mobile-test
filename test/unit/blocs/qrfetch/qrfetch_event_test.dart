import 'package:qr_code_test/blocs/qrfetch/qrfetch.dart';
import 'package:test/test.dart';

void main() {
  group("QRFetchEvent tests to make sure that value comparison works", () {
    test("Making sure Equatable has been properly overridden", () {
      expect(const FetchNewQR(), const FetchNewQR());
    });
  });
}