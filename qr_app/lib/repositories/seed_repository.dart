import 'package:qr_app/models/seed_data.dart';
import 'package:qr_app/repositories/repository_base.dart';

class SeedRepository extends RepositoryBase<SeedData> {
  Future<SeedData> retrieve() async {
    return await get('/seed', (String json) => SeedData.fromJson(json));
  }
}
