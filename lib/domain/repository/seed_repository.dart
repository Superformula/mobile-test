import 'package:qrGenerator/domain/models/seed.dart';

/// Interface to the Seed Repository. The repository is the data store interface, of which there may be
/// concrete implementations of remote clients (for network interactions) and cache clients (for access to local caches).
abstract class SeedRepository {
  Future<Seed> getSeed();
}