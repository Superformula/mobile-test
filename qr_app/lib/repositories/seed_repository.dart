import 'package:qr_app/models/seed_data.dart';
import 'package:qr_app/repositories/base_repository.dart';

class SeedRepository extends BaseRepository {
  Future<SeedData> retrieve() async {
    String data = await service.get('/seed');
    return SeedData.fromJson(data);
  }
}
