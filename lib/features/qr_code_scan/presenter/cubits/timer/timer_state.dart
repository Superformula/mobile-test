part of 'timer_cubit.dart';

sealed class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object> get props => [];
}

final class TimerInitialState extends TimerState {
  const TimerInitialState();
}

final class TimerInProgressState extends TimerState {
  const TimerInProgressState({
    required this.remainingSeconds,
    required this.durationSeconds,
  });
  final int remainingSeconds;
  final int durationSeconds;

  @override
  List<Object> get props => [remainingSeconds, durationSeconds];
}

final class TimerFinishedState extends TimerState {
  const TimerFinishedState();
}
