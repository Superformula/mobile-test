import '../../models/seed.dart';

class SeedLocalGateway {
  const SeedLocalGateway();

  Future<Seed?> fetchSeed() {
    return Future<Seed?>.value(
      Seed(
        value: '',
        expiration: DateTime.now(),
      ),
    );
  }

  Future<void> saveSeed(Seed? seed) {
    return Future<void>.value();
  }
}
