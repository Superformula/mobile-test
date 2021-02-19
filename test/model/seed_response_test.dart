import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/model/seed.dart';

import 'seed_mock.dart';

void main() {
  test('Seed Response is correctly parsed', () async {
    final SeedResponse seedResponse = SeedResponse.fromJson(mockSeed);
    expect(seedResponse.seed.length, 6);
    expect(seedResponse.seed, '2a6abu');
    expect(seedResponse.expiresAt, '2080-02-18T23:42:30.802Z');
  });

  test('Seed Response handles null data', () async {
    final SeedResponse seedResponse = SeedResponse.fromJson(mockSeedNullData);
    expect(seedResponse.seed?.length, null);
    expect(seedResponse.seed, null);
    expect(seedResponse.expiresAt, null);
  });
}
