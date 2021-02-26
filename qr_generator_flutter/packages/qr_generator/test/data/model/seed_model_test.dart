import 'dart:convert';
import 'package:test/test.dart';

import 'package:qr_generator/qr_generator.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tSeedModel = SeedModel(
    seed: 'c3399acf-2a3b-4a7c-b1bd-267daa47fbb9',
    expiresAt: DateTime.parse('2021-02-25T06:12:31.453Z'),
  );

  test(
    'should be a subclass of Seed entity',
    () async {
      // assert
      expect(tSeedModel, isA<Seed>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('seed_local.json'));
        // act
        final result = SeedModel.fromJson(jsonMap);
        // assert
        expect(result, tSeedModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tSeedModel.toJson();
        // assert
        final expectedMap = {
          'seed': tSeedModel.seed,
          'expires_at': tSeedModel.expiresAt.toIso8601String(),
        };
        expect(result, expectedMap);
      },
    );
  });
}
