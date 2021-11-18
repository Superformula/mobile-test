import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  //_starttime holds the value of seconds to expiration of the seed
  int startTime;
  TimerProvider({required this.startTime});
//exposes _start time to external classes
  get timeLeft => startTime;

  updateStartTime(int time) {
    startTime = time;
  }

//Decrements _starttime by 1
  decrementTimer() {
    startTime--;
    notifyListeners();
  }

  bool isSeedExpired(String expiresAt) {
    return DateTime.now().isAfter(DateTime.parse(expiresAt)) ? true : false;
  }

//Takes in the string of the seed expiresAt property and checks the difference in seconds between now and the expiration date
//Saves that difference in _startTime
  getTimeToExpire(String expiresAt, DateTime dateTime) {
    startTime = DateTime.parse(expiresAt).difference(dateTime).inSeconds;

    notifyListeners();
  }
}
