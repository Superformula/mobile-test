import 'package:qrcode_app/domain/entities/seed.dart';

class SeedApiDatasource {
  static Future<Seed> getSeed() async {
    return Future.delayed(Duration(seconds: 3)).then((value) => Seed(
        seed: 'asdhis',
        expirationDate: DateTime.now().add(Duration(hours: 2))));
  }
}
