import 'package:qrGenerator/domain/models/seed.dart';
import 'package:qrGenerator/domain/repository/seed_repository.dart';

/// Use cases such as these define the business logic for the app. Its responsibility is to provide the app's
/// business operations to the view models that depend on it.
class GetSeedUseCase {
  SeedRepository _seedRepository;

  GetSeedUseCase(this._seedRepository);

  Future<Seed> getSeed() {
    return _seedRepository.getSeed();
  }
}