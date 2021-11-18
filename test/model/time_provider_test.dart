import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_test/model/time_provider.dart';

void main() {
  group('Timer provider tests', () {
    test('When time is initialized, starts at 0', () {
      final timerKeeper = TimerProvider(startTime: 0);

      expect(timerKeeper.startTime, 0);
    });

    test('When subtract timmer is called', () {
      final timerKeeper = TimerProvider(startTime: 3);

      timerKeeper.decrementTimer();

      expect(timerKeeper.startTime, 2);
    });

    test('When get time to expire is called', () {
      final timerKeeper = TimerProvider(startTime: 0);

      timerKeeper.getTimeToExpire(
          '2021-11-12T21:45:30', DateTime(2021, 11, 12, 21, 45, 20));

      expect(timerKeeper.startTime, 10);
    });

    test('When update time is called', () {
      final timerKeeper = TimerProvider(startTime: 0);

      timerKeeper.updateStartTime(10);

      expect(timerKeeper.startTime, 10);
    });
  });
}
