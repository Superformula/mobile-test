import 'package:qrgenerator/domain/models/seed.dart';

///
/// SeedRepository provides access to seed data.
///
abstract class SeedRepository {
  Future<Seed> readSeed();
}
