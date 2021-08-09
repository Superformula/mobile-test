import 'package:flutter/material.dart';
import 'dart:async';

class TimerProvider extends ChangeNotifier {
  TimerProvider();
  Timer? timer;

  int? _countdown = 15;
  int? get countdown => _countdown;

  bool? _expired = false;
  bool? get expired => _expired;

  Future<void> startClock() async {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown! < 1) {
        _expired = true;
        cancelTimer();
      } else {
        _countdown = _countdown! - 1;
      }

      notifyListeners();
    });
  }

  void expire() {
    _expired = !_expired!;
    notifyListeners();
  }

  void setExpire(bool expire) {
    _expired = expire;
    notifyListeners();
  }

  void reset() {
    _countdown = 15;
    notifyListeners();
  }

  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  cancelTimer() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
  }
}
