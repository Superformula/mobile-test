import 'dart:convert';
import 'dart:math';

import 'mobile_test.dart';

const expirationDurationInSeconds = 10000;

class MobileTestChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/seed").linkFunction((request) async {
      final seed = _getRandomHex();
      final expirationTime = DateTime.now()
          .add(const Duration(milliseconds: expirationDurationInMilliseconds))
          .toIso8601String();
      return Response.ok({'seed': seed, 'expires_at': expirationTime});
    });

    return router;
  }

  String _getRandomHex() {
    final rand = Random.secure();
    final ints = List<int>.generate(32, (index) => rand.nextInt(256));
    return base64Url.encode(ints);
  }
}
