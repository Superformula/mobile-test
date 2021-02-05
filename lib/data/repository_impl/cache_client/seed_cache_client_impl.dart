import 'package:qrGenerator/domain/models/seed.dart';

abstract class SeedCacheClient {
  Future<Seed> getLocalSeed();
}

/// This stub is not implemented, but added merely to demonstrate how a cache implementation would
/// fit into this architecture.
class SeedCacheClientImpl implements SeedCacheClient {
  @override
  Future<Seed> getLocalSeed() {
    // TODO: implement getLocalSeed
    throw UnimplementedError();
  }
}