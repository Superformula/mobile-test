import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/model/seed.dart';

import 'seed_mock.dart';

void main() {
  test('Seed Response is correctly parsed', () async {
    final SeedResponse seedResponse = SeedResponse.fromJson(mockSeed);
    expect(seedResponse.seed.length, 32);
    expect(seedResponse.seed, 'COLPTD1YYA910YPAGW4WJYCF1GO979ZP');
    expect(seedResponse.expiresAt, '10-20-2031');
  });
}
