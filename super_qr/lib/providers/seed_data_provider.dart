import 'dart:async';
import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:super_qr/models/seed.dart';

const SEED_FUNCTION_NAME = "seed";
const REFRESH_INTERVAL_SECONDS = 15;

class SeedDataProvider {
  // Our callable cloud function that returns a seed
  final HttpsCallable seedFunctionCallable =
      CloudFunctions.instance.getHttpsCallable(
    functionName: SEED_FUNCTION_NAME,
  );

  // Stream controller and stream for the currentSeed.
  StreamController<Seed> _currentSeedController = StreamController<Seed>();
  Stream<Seed> get currentSeed => _currentSeedController.stream;

  // A timer that will refresh the QR code with a new seed.
  // Future addition: customizable interval by user.
  Timer refreshTimer;

  SeedDataProvider() {
    startTimer();
  }

  Future dispose() async {
    _currentSeedController.close();
    stopTimer();
  }

  /// Start the timer to auto refresh the QR Code
  void startTimer() {
    refreshSeed();

    final Duration refreshDuration =
        Duration(seconds: REFRESH_INTERVAL_SECONDS);

    refreshTimer = Timer.periodic(refreshDuration, (Timer t) {
      refreshSeed();
    });
  }

  /// Stop the timer to auto refresh the QR code.
  void stopTimer() {
    refreshTimer.cancel();
  }

  /// Refresh the current seed by fetching a seed and pushing to stream. Intended
  /// to be called from a timer.
  Future refreshSeed() async {
    // TODO: Error handling.
    dynamic resp = await seedFunctionCallable.call().catchError((e) {
      print(e);
      return;
    });
    // TODO: Error handle on decode
    Seed newSeed = Seed.fromJson(resp.data);
    _currentSeedController.add(newSeed);
  }
}
