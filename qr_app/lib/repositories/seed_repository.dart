import 'package:qr_app/models/seed_data.dart';

import 'base_repository.dart';

class SeedRepository extends BaseRepository {
  Future<SeedData> retrieve() async {
    if (configurationService.loadMockData)
      return configurationService.mockDataGenerator.next();

    String data =
        await retrieveElement('${configurationService.host}/seedData');
    return SeedData.fromJson(data);
  }
}
