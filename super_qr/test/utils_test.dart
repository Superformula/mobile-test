import 'package:flutter_test/flutter_test.dart';
import 'package:super_qr/utils/utils.dart';

void main() {
  group('Utils', () {
    test('should get difference from now', () {
      expect(
          getDifferenceFromNow(DateTime.now().add(Duration(minutes: 2)))
              .inSeconds,
          119); // TODO: Cleanup stability, assert within range.
    });
  });
}
