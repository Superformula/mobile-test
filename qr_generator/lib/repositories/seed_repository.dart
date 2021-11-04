import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:qr_generator/model/seed_model.dart';
import 'package:qr_generator/utils/api_client.dart';

class SeedRepository {
  final ApiClient netUtil;
  SeedRepository({@required this.netUtil}) : assert(netUtil != null);

  //Get new seed data 
  Future<SeedModel> getSeedData() async {
    const url = 'seed';
    dynamic response = await netUtil.getDio(url);
    return SeedModel.fromJson(response.data['data']);
  }
  //Validating string data from qr code
  Future<bool> validateSeedData(String seedData) async {
    await Future.delayed(const Duration(seconds: 2));
    Random r = Random();
    bool booleanResult = r.nextDouble() > .5;
    return booleanResult;
  }
}
