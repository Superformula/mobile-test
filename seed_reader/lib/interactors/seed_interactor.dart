import '../models/seed.dart';

int count = 0;

class SeedInteractor {
  const SeedInteractor();
  Future<Seed> fetchSeed() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (count > 2) {
      return Future<Seed>.value(
        Seed(
          value: 'foobar',
          expiration: DateTime.now().add(
            const Duration(seconds: 2),
          ),
        ),
      );
    }
    count++;
    return Future<Seed>.error('');
  }
}
