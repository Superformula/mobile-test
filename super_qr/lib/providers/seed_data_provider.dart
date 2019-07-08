import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:super_qr/models/seed.dart';
import 'package:super_qr/utils/utils.dart';

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

  SeedDataProvider() {
    refreshSeed();
  }

  Future dispose() async {
    _currentSeedController.close();
  }

  /// Schedule a delayed task to refresh the seed.
  void scheduleRefresh(DateTime expires) {
    Future.delayed(getDifferenceFromNow(expires), () {
      refreshSeed();
    });
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
    scheduleRefresh(newSeed.expiresAt);
  }
}
