import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/timer/timer_cubit.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('TimerCubit |', () {
    late TimerCubit timerCubit;
    late DateTime finishAt;

    setUp(() {
      timerCubit = TimerCubit();
      finishAt = DateTime.now().add(const Duration(seconds: 3));
    });

    tearDown(() {
      timerCubit.close();
    });

    blocTest<TimerCubit, TimerState>(
      'should emit [TimerInProgressState] when startTimer is called',
      build: () => timerCubit,
      act: (cubit) => cubit.startTimer(finishAt: finishAt),
      expect: () => const <TimerInProgressState>[
        TimerInProgressState(remainingSeconds: 2, durationSeconds: 2),
      ],
    );

    blocTest<TimerCubit, TimerState>(
      'should emit [TimerFinishedState] when disposeTimer is called',
      build: () => timerCubit,
      act: (cubit) {
        cubit.startTimer(finishAt: finishAt);
        cubit.disposeTimer();
      },
      expect: () => const <TimerState>[
        TimerInProgressState(remainingSeconds: 2, durationSeconds: 2),
        TimerFinishedState(),
      ],
    );
  });
}
