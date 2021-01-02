import 'package:qr_code_test/blocs/validation/validation.dart';
import 'package:test/test.dart';

void main() {
  group("ValidationEvent tests to make sure that value comparison works", () {
    test("Making sure Equatable has been properly overridden", () {
      expect(const ValidationNone(), equals(const ValidationNone()));
      expect(const ValidationSuccess("test"),
          equals(const ValidationSuccess("test")));
      expect(const ValidationFailed("test"),
          equals(const ValidationFailed("test")));
    });
  });
}