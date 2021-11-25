import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_test/controller/services/local_cache.dart';
import 'package:qr_test/model/data_seed.dart';

class MockBox extends Mock implements Box {}

class MockHiveInterface extends Mock implements HiveInterface {}

void main() {
  test('local cache ...', () async {
    MockHiveInterface().openBox('testBox');
    Box box = MockHiveInterface().box('testBox');
    MockBox mockBox = MockBox();
    LocalCacheImpl dataSeedCache = LocalCacheImpl(box: box);
    DataSeed seed = DataSeed(data: 'randomString', expiresAt: '2021-03-12');
    await dataSeedCache.cacheLastDataSeed(seed);

    expect(box.isNotEmpty, true);
  });
}
