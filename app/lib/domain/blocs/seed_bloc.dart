import 'dart:async';

import 'package:qrgenerator/core/inject/inject.dart';
import 'package:qrgenerator/domain/abstractions/seed_repository.dart';
import 'package:qrgenerator/domain/models/seed.dart';
import 'package:rxdart/rxdart.dart';

///
/// SeedBloc provides business logic dealing with seed access.
///
class SeedBloc {
  final _repository = inject<SeedRepository>();
  final _seedSubject = BehaviorSubject<Seed>();
  final _countDownSubject = BehaviorSubject<int>();

  Seed _seed;
  Timer _timer;
  Timer _countDown;

  Observable<Seed> get seed => _seedSubject.stream;
  Observable<int> get countDown => _countDownSubject.stream;

  SeedBloc() {
    _refresh();
  }

  void dispose() {
    _seedSubject.close();
    _countDownSubject.close();
    _timer?.cancel();
    _countDown?.cancel();
  }

  void _scheduleRefresh(DateTime expiresAt) {
    int dur = expiresAt.difference(DateTime.now()).inSeconds;
    _timer?.cancel();
    _timer = Timer(Duration(seconds: dur), () {
      _refresh();
    });
  }

  void _startCountDown() {
    _countDown?.cancel();
    _countDown = Timer.periodic(Duration(seconds: 1), (_) {
      int timeRemaining = _calcRemainingTime(_seed.expiresAt);
      if (timeRemaining == 0) {
        _countDown.cancel();
      }
      _countDownSubject.add(timeRemaining);
    });
  }

  int _calcRemainingTime(DateTime expiresAt) {
    return expiresAt.difference(DateTime.now()).inSeconds;
  }

  Future<void> _refresh() async {
    try {
      _seed = await _repository.readSeed();
      _seedSubject.add(_seed);
      _startCountDown();
      _scheduleRefresh(_seed.expiresAt);
    } catch (error) {
      _seedSubject.addError(error);
    }
  }
}
