import 'dart:async';

import 'package:flutter/material.dart';

class QRProvider extends ChangeNotifier {
  bool isLoading = false;

  QRProvider() {
    _startLoading();
    Future.delayed(Duration(seconds: 3)).then((value) {
      _stopLoading();
      startTimer(countDownValue: 30);
    }).onError((error, stackTrace) {
      _stopLoading();
    });
  }

  Timer? _timer;
  int countdown = 15;

  void startTimer({int countDownValue = 15}) {
    if (_timer != null) {
      _timer?.cancel();
    }
    countdown = countDownValue;
    notifyListeners();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        countdown--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void _startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void _stopLoading() {
    isLoading = false;
    notifyListeners();
  }
}
