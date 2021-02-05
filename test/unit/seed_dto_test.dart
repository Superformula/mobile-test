import 'package:flutter_test/flutter_test.dart';
import 'package:qrGenerator/domain/models/seed_dto.dart';

void main() {
  group('Seed model mapping tests', () {
    var testMap = {
      'seed' : 'seed',
      'expiresAt' : '2021-01-01T00:00:00.000'
    };

    SeedDTO seedOne = SeedDTO('seed', DateTime(2021, 1, 1));

    test('Seed DTO model to map test', () {
      expect(seedOne.toJson(), equals(testMap));
    });

    test('JSON to Seed DTO Date/Time mapping test',() {
      var seedTwo = SeedDTO.fromJson(testMap);
      expect(seedTwo.expiresAt == seedOne.expiresAt, equals(true));
    });
  });
}
