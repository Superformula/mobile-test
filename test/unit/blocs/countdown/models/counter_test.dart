import 'package:qr_code_test/blocs/countdown/countdown.dart';
import 'package:test/test.dart';

void main() {
  final time = 5;

  test("Testing the countdown stream", () {
    final counter = Counter().periodicStream(5);
    final expects = List<int>.generate(time, (index) => time - index - 1);

    expectLater(counter, emitsInOrder(expects));
  });
}