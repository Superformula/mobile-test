import '../../interactors/gateways/seed_api_gateway.dart';
import '../../interactors/gateways/seed_local_gateway.dart';

import '../errors.dart';
import '../models/seed.dart';
import 'gateways/connectivity.dart';

class SeedInteractor {
  const SeedInteractor({
    required SeedLocalGateway seedLocalGateway,
    required SeedApiGateway seedApiGateway,
    required CanFetchType canFetch,
  })  : _seedLocalGateway = seedLocalGateway,
        _seedApiGateway = seedApiGateway,
        _canFetch = canFetch;

  final CanFetchType _canFetch;
  final SeedLocalGateway _seedLocalGateway;
  final SeedApiGateway _seedApiGateway;

  Future<Seed> fetchSeed() async {
    final Seed? currentSeed = await _seedLocalGateway.fetchSeed();
    if (currentSeed != null) {
      return currentSeed;
    }
    return _checkConnectivity()
        .then((_) => _seedApiGateway.fetchSeed())
        .then((Seed seed) {
      _seedLocalGateway.saveSeed(seed);
      return seed;
    });
  }

  Future<bool> _checkConnectivity() => _canFetch().then(
        (bool canFetch) {
          if (!canFetch) {
            throw NotConnectedToFetchError();
          }
          return canFetch;
        },
      );

  bool isValid(Seed seed) =>
      seed.expiration.difference(DateTime.now()).inSeconds > 0;
}
