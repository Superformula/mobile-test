import '../../models/seed.dart';

class SeedApiGateway {
  const SeedApiGateway();

  Future<Seed> fetchSeed() {
    return Future<Seed>.value(
      Seed(
        value: '',
        expiration: DateTime.now(),
      ),
    );
  }
}
