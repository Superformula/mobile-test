import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_test/blocs/countdown/countdown.dart';

/// This bloc implements the logic of a countdown timer that emits new values
/// each second.
class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  /// The source containing the stream
  final Counter _counter;
  /// The stream subscriber
  StreamSubscription<int> _tickerSubscription;

  /// Requires a [Counter] instance which will start the stream
  CountdownBloc({
    @required Counter counter,
  })  : _counter = counter,
        super(const CountdownInitial(0));

  @override
  Stream<CountdownState> mapEventToState(CountdownEvent event) async* {
    if (event is CountdownStarted) {
      yield* _mapCountdownStarted(event);
    }

    if (event is CountdownTicked) {
      yield* _mapCountdownTicked(event);
    }

    if (event is CountdownStopped) {
      yield* _mapCountdownStopped(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<CountdownState> _mapCountdownStarted(CountdownStarted event) async* {
    yield CountdownInProgress(event.duration);

    // Make sure it's not active
    await _tickerSubscription?.cancel();

    // Start a new subscription to the countdown
    _tickerSubscription = _counter
        .periodicStream(event.duration)
        .listen((duration) => add(CountdownTicked(duration: duration)));
  }

  Stream<CountdownState> _mapCountdownTicked(CountdownTicked event) async* {
    if (event.duration > 0) {
      yield CountdownInProgress(event.duration);
    } else {
      yield const CountdownCompleted();
    }
  }

  Stream<CountdownState> _mapCountdownStopped(CountdownStopped event) async* {
    // Stop the stream
    await _tickerSubscription?.cancel();

    // Reset to 0
    yield const CountdownInitial(0);
  }
}