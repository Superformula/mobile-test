import 'package:qr_code_test/blocs/countdown/countdown.dart';
import 'package:test/test.dart';

void main() {
  group("CountdownEvent tests to make sure that value comparison works", () {
    test("Making sure Equatable has been properly overridden", () {
      expect(const CountdownStarted(duration: 1),
          const CountdownStarted(duration: 1));
      expect(const CountdownTicked(duration: 1),
          const CountdownTicked(duration: 1));
      expect(const CountdownStopped(), const CountdownStopped());

      expect(const CountdownStarted(duration: 1),
          isNot(const CountdownStarted(duration: 0)));
      expect(const CountdownTicked(duration: 1),
          isNot(const CountdownTicked(duration: 0)));
    });
  });
}