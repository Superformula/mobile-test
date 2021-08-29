import 'dart:async';

import 'package:flutter/material.dart';
import 'package:superformula_test/core/service_locator.dart';
import 'package:superformula_test/core/utilities.dart';
import 'package:superformula_test/domain/qr_code/repository/qr_code_repo.dart';

class QRProvider extends ChangeNotifier {
  final RestClient client = ServiceLocator.locator<RestClient>();
  bool isLoading = false;
  bool isDispose = false;
  String? decodedString;

  QRProvider() {
    _startLoading();
    client.getSeed().then((value) {
      decodedString = Utils.decodeString(value.seed);
      _stopLoading();
      startTimer(countDownValue: getDuration(value.expiresAt));
    }).onError((error, stackTrace) {
      print(error);
      _stopLoading();
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
    }
    isDispose = true;
    super.dispose();
  }

  Timer? _timer;
  int countdown = 15;

  void startTimer({int countDownValue = 15}) {
    if (_timer != null) {
      _timer?.cancel();
    }
    countdown = countDownValue;
    refreshUI();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        countdown--;
        refreshUI();
      } else {
        timer.cancel();
      }
    });
  }

  void _startLoading() {
    isLoading = true;
    refreshUI();
  }

  void _stopLoading() {
    isLoading = false;
    refreshUI();
  }

  int getDuration(DateTime? dateTime) {
    if (dateTime != null) {
      return dateTime.difference(DateTime.now()).inSeconds;
    }
    return 0;
  }

  void refreshUI() {
    if (!isDispose) {
      notifyListeners();
    }
  }
}
