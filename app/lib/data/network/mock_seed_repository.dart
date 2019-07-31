import 'dart:async';
import 'dart:math';

import 'package:qrgenerator/domain/abstractions/seed_repository.dart';
import 'package:qrgenerator/domain/models/seed.dart';

///
/// MockSeedRepository returns canned seed data.
///
class MockSeedRepository implements SeedRepository {
  final random = Random.secure();

  @override
  Future<Seed> readSeed() async {
    Seed seed = Seed((b) {
      b.value = _getRandomString(16);
      b.expiresAtStr = DateTime.now().add(Duration(seconds: 10)).toIso8601String();
    });
    // Add some delay to simulate a network connection.
    return Future.value(seed);
  }

  String _getRandomString(int numValues) {
    var values = List<int>.generate(numValues, (i) => random.nextInt(256));
    var buffer = StringBuffer();
    values.forEach((value) {
      buffer.write(value.toRadixString(16));
    });
    return buffer.toString().toUpperCase();
  }
}
