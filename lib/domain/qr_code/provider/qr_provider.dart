import 'dart:async';

import 'package:flutter/material.dart';

class QRProvider extends ChangeNotifier {
  QRProvider() {
    startTimer();
  }

  Timer? _timer;
  int countdown = 15;

  void startTimer() {
    if (_timer != null) {
      _timer?.cancel();
      countdown = 15;
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        countdown--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }
}
