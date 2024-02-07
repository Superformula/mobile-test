import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/timer/timer_cubit.dart';

void main() {
  group('TimerCubit ||', () {
    late TimerCubit timerCubit;

    setUp(() {
      timerCubit = TimerCubit();
    });

    tearDown(() {
      timerCubit.disposeTimer();
      timerCubit.close();
    });

    test('initial state is TimerInitialState', () {
      expect(timerCubit.state, equals(const TimerInitialState()));
    });

    test('startTimer emits TimerInProgressState', () {
      const durationSeconds = 10;
      timerCubit.startTimer(durationSeconds: durationSeconds);
      expect(
        timerCubit.state,
        equals(const TimerInProgressState(
          remainingSeconds: durationSeconds,
          durationSeconds: durationSeconds,
        )),
      );
    });

    test('timer emits TimerFinishedState when finished', () {
      timerCubit.startTimer(durationSeconds: 1);
      timerCubit.emit(const TimerInProgressState(
        remainingSeconds: 1,
        durationSeconds: 1,
      ));
      timerCubit.disposeTimer();
      expect(timerCubit.state, equals(const TimerFinishedState()));
    });
  });
}
