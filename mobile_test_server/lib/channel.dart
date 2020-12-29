import 'dart:convert';
import 'dart:math';

import 'package:mobile_test/model/qr_code.dart';

import 'mobile_test.dart';

const expirationDurationInSeconds = 10;
const bool testMode = true;

class MobileTestChannel extends ApplicationChannel {
  final _database = {}; // a simulated database for QR storage
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route('/seed').linkFunction(_seed);
    router.route('/validate').linkFunction(_validate);

    return router;
  }

  FutureOr<RequestOrResponse> _seed(Request request) async {
    final seed = _getRandomHex();
    final expirationTime = DateTime.now()
        .add(const Duration(seconds: expirationDurationInSeconds));
    _database[seed] = QrCode(code: seed, expiresAt: expirationTime);
    return Response.ok(
        {'seed': seed, 'expires_at': expirationTime.toIso8601String()});
  }

  String _getRandomHex() {
    final rand = Random.secure();
    final ints = List<int>.generate(32, (index) => rand.nextInt(256));
    return base64Url.encode(ints);
  }

  FutureOr<RequestOrResponse> _validate(Request request) async {
    final code = await request.body.decode();
    if (testMode) {
      return Response.ok({'isValid': true, 'testMode': true});
    }

    if (code == null) {
      return Response.badRequest(body: {'code': 'Missing "code" parameter'});
    }

    bool isValid;
    if (_database.containsKey(code)) {
      isValid = true;
      print('Code is valid');
    } else {
      isValid = false;
      print('Code is invalid');
    }

    return Response.ok({'isValid': isValid});
  }
}
