import 'dart:async';

import 'package:supercode/models.dart';

class CancelTimer {}

class UpdateTimer {
  final Timer timer;

  UpdateTimer(this.timer);
}

class FetchQRSeed {}

class FetchQRSeedSuccess {
  final Seed seed;

  FetchQRSeedSuccess(this.seed);
}

class TimerTick {}
