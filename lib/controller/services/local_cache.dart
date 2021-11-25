import 'package:hive_flutter/hive_flutter.dart';

import 'package:qr_test/model/data_seed.dart';

abstract class LocalCache {
  ///Gets cached Data Seed
  getLastDataSeed();

  ///Saves Data Seed in cache
  Future<void> cacheLastDataSeed(DataSeed dataSeedToCache);

  ///Returns true if cache is empty
  bool isCacheEmpty();
}

class LocalCacheImpl implements LocalCache {
  final Box box;
  LocalCacheImpl({required this.box});

  @override
  Future<void> cacheLastDataSeed(DataSeed dataSeedToCache) async {
    box.isEmpty ? box.add(dataSeedToCache) : box.putAt(0, dataSeedToCache);
  }

  @override
  bool isCacheEmpty() {
    return box.isEmpty == true ? true : false;
  }

  @override
  DataSeed getLastDataSeed() {
    DataSeed? seed = box.getAt(0);
    return seed!;
  }
}
