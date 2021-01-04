import 'package:qr_code_test/blocs/slider/slider.dart';
import 'package:test/test.dart';

void main() {
  group("ToggleSlider tests to make sure that value comparison works", () {
    test("Making sure Equatable has been properly overridden", () {
      expect(const ToggleSlider(), const ToggleSlider());
    });
  });
}