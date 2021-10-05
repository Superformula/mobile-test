import 'package:flutter_test/flutter_test.dart';
import 'package:seed_reader/design_tokens/dimensions.dart';

void main() {
  test('dimensions', () {
    expect(Dimensions.xSmall, 2);
    expect(Dimensions.xSmall, 4);
    expect(Dimensions.small, 8);
    expect(Dimensions.regular, 16);
    expect(Dimensions.large, 32);
  });
}
