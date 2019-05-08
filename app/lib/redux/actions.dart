import 'dart:async';

import 'package:supercode/models.dart';

class CancelTimer {}

class UpdateTimer {
  final Timer timer;

  UpdateTimer(this.timer);
}

class FetchQRCode {}

class FetchQRCodeSuccess {
  final Seed seed;

  FetchQRCodeSuccess(this.seed);
}

class NavigateToQRCode {}

class TimerTick {}
