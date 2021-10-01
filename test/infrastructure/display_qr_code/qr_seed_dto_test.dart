import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/entities/qr_seed.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_data.dart';
import 'package:superformula_mobile_test/domain/display_qr_code/value_objects/qr_seed_expiration_date.dart';
import 'package:superformula_mobile_test/infrastructure/display_qr_code/qr_seed_dto.dart';

import '../../setup/test_helpers.dart';

void main() {
  const seed = 'd43397d129c3de9e4b6c3974c1c16d1f';
  const expirationDate = '1979-11-12T13:10:42.24Z';
  const qrSeedDto = QrSeedDto(seed: seed, expiresAt: expirationDate);
  final qrSeed = QrSeed(
    seed: QrSeedData(seed),
    expiresAt: QrSeedExpirationDate.withString(expirationDate),
  );

  group('QrSeedDto -', () {
    group('fromJson -', () {
      test('When the JSON seed is an integer returns valid DTO', () {
        final jsonMap =
            json.decode(fixture('simple_qrseed.json')) as Map<String, dynamic>;
        final result = QrSeedDto.fromJson(jsonMap);
        expect(result, qrSeedDto);
      });
    });

    group('toDomain -', () {
      test('When the DTO is valid returns valid domain', () {
        final result = qrSeedDto.toDomain();
        expect(result, qrSeed);
      });
    });
  });
}
