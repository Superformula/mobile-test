import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:qrcode_app/data/models/seed_mapper.dart';
import 'package:qrcode_app/data/models/seed_model.dart';
import 'package:qrcode_app/domain/entities/seed.dart';

void main() {
  test('Seed model should parse json and return a Seed entity', () {
    String fakeJson =
        '{"seed":"RU-kDEoRh0g=","expiration":"2021-06-27 22:56:20.556149"}';

    SeedMapper mapper = SeedMapper();
    dynamic seed = mapper.toSeed(SeedDto.fromJson(json.decode(fakeJson)));
    expect(seed, isA<Seed>());
  });
}
