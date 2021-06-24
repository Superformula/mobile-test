import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_generator/domain/failures/common_failure.dart';
import 'package:qr_generator/domain/seed.dart';
import 'package:qr_generator/infrastructure/seed_generator_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SeedGeneratorRepository seedGeneratorRepository;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    seedGeneratorRepository = SeedGeneratorRepository(prefs, Dio());
  });

  test('When getSeed is called, Then a seed should be obtained', () async {
    final seedOrFailure = await seedGeneratorRepository.fetchSeed();
    expect(seedOrFailure, isA<Right<CommonFailure, Seed>>());
  });
}
