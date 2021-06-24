import 'package:qrcode_app/domain/entities/seed.dart';

class SeedModel {
  late String seed;
  late DateTime expirationDate;

  Seed fromJson(dynamic json) {
    seed = json['seed'] ?? 'default';
    expirationDate =
        json['expiration'] ?? DateTime.now().add(Duration(hours: 1));
    return Seed(expirationDate: expirationDate, seed: seed);
  }
}
