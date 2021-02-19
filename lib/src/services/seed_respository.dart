import 'package:mobile_test/src/model/seed.dart';
import 'package:mobile_test/src/services/seed_api_provider.dart';

class SeedRepository {
  factory SeedRepository() {
    singleton ??= SeedRepository._internal();
    return singleton;
  }

  SeedRepository._internal();
  static SeedRepository singleton;

  Future<SeedResponse> fetchSeed({SeedApiProvider seedApiProvider}) {
    seedApiProvider ??= SeedApiProvider();
    return seedApiProvider.getSeedResponse();
  }
}
