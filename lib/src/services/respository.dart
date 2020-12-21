import 'package:mobile_test/src/model/seed.dart';

import 'api_provider.dart';

class SeedRepository {
  ApiProvider appApiProvider = ApiProvider();

  Future<SeedResponse> fetchSeed() => appApiProvider.fetchSeed();
}
