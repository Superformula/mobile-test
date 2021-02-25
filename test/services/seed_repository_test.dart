import 'dart:io' as io;

import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_test/src/model/seed.dart';
import 'package:mobile_test/src/services/seed_respository.dart';
import 'package:mockito/mockito.dart';

import '../mock_set_up/mock_classes.dart';
import '../model/seed_mock.dart';

void main() {
  SeedRepository service;
  TestWidgetsFlutterBinding.ensureInitialized();
  io.HttpOverrides.global = null;

  test('get successful data from provider', () async {
    await dot_env.load();
    service = SeedRepository();
    final MockSeedApiProvider mockSeedApiProvider = MockSeedApiProvider();
    when(mockSeedApiProvider.getSeedResponse()).thenAnswer(
        (_) => Future<SeedResponse>.value(SeedResponse.fromJson(mockSeed)));
    final SeedResponse response =
        await service.fetchSeed(seedApiProvider: mockSeedApiProvider);
    expect(response.expiresAt, '2080-02-18T23:42:30.802Z');
  });

  test('get null data from when service call returns null object', () async {
    await dot_env.load();
    service = SeedRepository();
    final MockSeedApiProvider mockSeedApiProvider = MockSeedApiProvider();
    when(mockSeedApiProvider.getSeedResponse()).thenAnswer((_) =>
        Future<SeedResponse>.value(SeedResponse.fromJson(mockSeedNullData)));
    final SeedResponse response =
        await service.fetchSeed(seedApiProvider: mockSeedApiProvider);
    expect(response.expiresAt, null);
    expect(response.seed, null);
  });
}
