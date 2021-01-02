import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_test/blocs/countdown/countdown.dart';

/// Events for the [CountdownBloc] bloc
abstract class CountdownEvent extends Equatable {
  const CountdownEvent();

  @override
  List<Object> get props => [];
}

/// Event that starts the timer with the given duration
class CountdownStarted extends CountdownEvent {
  /// The duration of the countdown
  final int duration;
  const CountdownStarted({@required this.duration});

  @override
  List<Object> get props => [duration];
}

/// Events to be periodically emitted
class CountdownTicked extends CountdownEvent {
  /// The new value of the timer at a certain point of the time
  final int duration;
  const CountdownTicked({@required this.duration});

  @override
  List<Object> get props => [duration];
}

/// Event that stops the timer
class CountdownStopped extends CountdownEvent {
  const CountdownStopped();
}