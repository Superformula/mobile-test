import 'package:qrGenerator/domain/models/seed.dart';
import 'package:qrGenerator/domain/repository/seed_repository.dart';

import 'remote_client/seed_remote_client_impl.dart';

/// Implementation of the Seed Repository. Its remote client instance interacts with the
/// remote Seed API to transact Seed operations.
class SeedRepositoryImpl implements SeedRepository {

  SeedRemoteClient _remoteClient;

  SeedRepositoryImpl(this._remoteClient);

  @override
  Future<Seed> getSeed() {
    return _remoteClient.getSeed();
  }
}