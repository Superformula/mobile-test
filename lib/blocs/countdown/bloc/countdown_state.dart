import 'package:equatable/equatable.dart';
import 'package:qr_code_test/blocs/countdown/countdown.dart';

/// States for the [CountdownBloc] bloc
abstract class CountdownState extends Equatable {
  /// The remaining time, expressed in seconds
  final int totalSeconds;
  const CountdownState(this.totalSeconds);

  /// The remaining time exposed with a convenient [Duration] object
  Duration get duration => Duration(seconds: totalSeconds);

  @override
  List<Object> get props => [totalSeconds];
}

/// Initial state of the timer
class CountdownInitial extends CountdownState {
  const CountdownInitial(int totalSeconds) : super(totalSeconds);
}

/// The timer is running...
class CountdownInProgress extends CountdownState {
  const CountdownInProgress(int seconds) : super(seconds);
}

/// The timer stopped
class CountdownCompleted extends CountdownState {
  const CountdownCompleted() : super(0);
}