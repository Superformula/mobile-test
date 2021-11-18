import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  //_starttime holds the value of seconds to expiration of the seed
  int countDown;
  TimerProvider({required this.countDown});
//exposes _start time to external classes
  get timeLeft => countDown;

  ///Updates startTime with the value of time
  updateStartTime(int time) {
    countDown = time;
  }

//Decrements _starttime by 1
  decrementTimer() {
    countDown--;
    notifyListeners();
  }

  ///Takes in the string expiresat and returns true if it's already expired
  bool isSeedExpired(String expiresAt) {
    return DateTime.now().isAfter(DateTime.parse(expiresAt)) ? true : false;
  }

//Takes in the string of the seed expiresAt property and checks the difference in seconds between now and the expiration date
//Saves that difference in _startTime
  getTimeToExpire(String expiresAt, DateTime dateTime) {
    countDown = DateTime.parse(expiresAt).difference(dateTime).inSeconds;

    notifyListeners();
  }
}
