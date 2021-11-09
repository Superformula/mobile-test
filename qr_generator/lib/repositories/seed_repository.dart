import 'dart:math';
import 'package:qr_generator/model/seed_model.dart';
import 'package:qr_generator/utils/api_client.dart';

class SeedRepository {
  final ApiClient netUtil;
  const SeedRepository({required this.netUtil});

  /// Get new seed data
  Future<SeedModel> getSeedData() async {
    dynamic response = await netUtil.getDio('seed');
    return SeedModel.fromJson(response.data['data']);
  }

  /// Validating string data from qr code
  Future<bool> validateSeedData(String seedData) async {
    await Future.delayed(const Duration(seconds: 2));
    Random r = Random();
    bool booleanResult = r.nextDouble() > .5;
    return booleanResult;
  }
}
