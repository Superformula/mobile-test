import 'package:flutter/cupertino.dart';
import 'package:superformula/data_layer/qr_seed.dart';
import 'package:superformula/data_layer/seed_respository.dart';

class MockSeedRepository implements SeedRepository {
  final String value;
  final int seconds;

  MockSeedRepository({@required this.value, @required this.seconds});

  @override
  Future<QrSeed> fetchLatestSeed() {
    final expiration = DateTime.now().add(Duration(seconds: seconds));
    return Future.value(QrSeed(
      seed: value,
      expiration: expiration,
      seconds: seconds,
    ));
  }
}
