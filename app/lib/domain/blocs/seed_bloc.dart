import 'dart:async';

import 'package:qrgenerator/core/inject/inject.dart';
import 'package:qrgenerator/domain/abstractions/seed_repository.dart';
import 'package:qrgenerator/domain/abstractions/settings_repository.dart';
import 'package:qrgenerator/domain/models/seed.dart';
import 'package:rxdart/rxdart.dart';

///
/// SeedBloc provides business logic dealing with seed access.
///
class SeedBloc {
  final _seedRepository = inject<SeedRepository>();
  final _settingsRepository = inject<SettingsRepository>();
  final _seedSubject = BehaviorSubject<Seed>();
  final _countDownSubject = BehaviorSubject<int>();

  Seed _seed;
  Timer _timer;
  Timer _countDown;

  Observable<Seed> get seed => _seedSubject.stream;
  Observable<int> get countDown => _countDownSubject.stream;

  SeedBloc() {
    Seed lastSeed = _settingsRepository.lastSeed;
    _refresh(lastSeed: lastSeed);
  }

  void dispose() {
    _seedSubject.close();
    _countDownSubject.close();
    _timer?.cancel();
    _countDown?.cancel();
  }

  void _scheduleRefresh(DateTime expiresAt) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: _calcRemainingTime(expiresAt)), () {
      _refresh();
    });
  }

  void _startCountDown() {
    _countDown?.cancel();
    _countDown = Timer.periodic(Duration(seconds: 1), (_) {
      int timeRemaining = _calcRemainingTime(_seed.expiresAt);
      if (timeRemaining <= 0) {
        _countDown.cancel();
      }
      _countDownSubject.add(timeRemaining);
    });
  }

  int _calcRemainingTime(DateTime expiresAt) {
    return expiresAt.difference(DateTime.now()).inSeconds;
  }

  Future<void> _refresh({Seed lastSeed}) async {
    try {
      // If there is a lastSeed and its not expired, start with that.
      // Otherwise get a new seed.
      if (lastSeed != null && lastSeed.isNotExpired) {
        _seed = lastSeed;
      } else {
        _seed = await _readSeed();
      }
      _seedSubject.add(_seed);
      _startCountDown();
      _scheduleRefresh(_seed.expiresAt);
    } catch (error) {
      _seedSubject.addError(error);
    }
  }

  // Read a new seed from the repository and persist in local settings.
  Future<Seed> _readSeed() async {
    Seed seed = await _seedRepository.readSeed();
    _settingsRepository.lastSeed = seed;
    return seed;
  }
}
