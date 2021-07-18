import '../entities/seed.dart';

abstract class SeedRepository {
  Future<Seed> getSeed();
}
