import 'package:flutter_test/flutter_test.dart';
import 'package:super_qr/models/seed.dart';

void main() {
  group('Seed', () {
    final dummySeed = '12341234123412341234123412341234';
    final utcTimeStamp = '2019-07-08T03:41:56.009Z';

    test('should parse JSON correctly', () {
      var json = {'seed': dummySeed, 'expires_at': utcTimeStamp};

      Seed testSeed = Seed.fromJson(json);

      expect(testSeed.expiresAt, DateTime.parse(utcTimeStamp));
      expect(testSeed.seed, dummySeed);
    });

    test('should generate JSON correctly', () {
      Seed testSeed = Seed(dummySeed, DateTime.parse(utcTimeStamp));

      var json = testSeed.toJson();

      expect(json, {'seed': dummySeed, 'expires_at': utcTimeStamp});
    });
  });
}
