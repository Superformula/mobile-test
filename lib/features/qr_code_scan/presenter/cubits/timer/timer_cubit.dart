import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

final class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerInitialState());

  Timer? _timer;

  void _onTick(Timer timer) {
    if (state is TimerInProgressState) {
      final runningState = state as TimerInProgressState;
      if (runningState.remainingSeconds > 0) {
        emit(
          TimerInProgressState(
            durationSeconds: runningState.durationSeconds,
            remainingSeconds: runningState.remainingSeconds - 1,
          ),
        );
      } else {
        disposeTimer();
      }
    }
  }

  void startTimer({required int durationSeconds}) {
    emit(
      TimerInProgressState(
          remainingSeconds: durationSeconds, durationSeconds: durationSeconds),
    );
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void disposeTimer() {
    emit(const TimerFinishedState());
    _timer?.cancel();
    _timer = null;
  }
}
