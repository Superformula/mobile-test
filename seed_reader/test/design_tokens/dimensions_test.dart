import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/design_tokens/dimensions.dart';

void main() {
  test('#xSmall', () {
    expect(Dimensions.xSmall, 4);
  });

  test('#small', () {
    expect(Dimensions.small, 8);
  });

  test('#regular', () {
    expect(Dimensions.regular, 16);
  });
}
