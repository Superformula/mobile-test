import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:qrtestcodeone/data/model/qr_seed_datamodel.dart';
import 'package:qrtestcodeone/domain/entity/qr_seed.dart';
import 'package:test/test.dart';

import '../fixtures/fixture_reader.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

void main() {
  final QrSeedDataModel model = QrSeedDataModel(
    'd43397d129c3de9e4b6c3974c1c16d1f',
    DateTime.parse('1979-11-12T13:10:42.24Z'),
  );
  test(
    'should be a subclass of Equatable',
    () async {
      // assert
      expect(model, isA<Equatable>());
    },
  );

  test(
    'should parse the json correctly when all fields are filled',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('qr_seed.json'));
      // act
      final result = QrSeedDataModel.fromJson(jsonMap);
      // assert
      expect(result, model);
    },
  );

  test(
    'should return a JSON map containing the proper data',
    () async {
      // act
      final result = model.toJson();
      // assert
      final expectedMap = json.decode(fixture('qr_seed.json'));
      expect(result, expectedMap);
    },
  );

  test(
    'should convert this to entity',
    () async {
      // act
      final result = model.toQrSeed();
      // assert
      expect(result, isA<QrSeed>());
    },
  );
}
