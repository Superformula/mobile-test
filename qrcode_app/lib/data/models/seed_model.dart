import 'package:qrcode_app/domain/entities/seed.dart';

class SeedModel {
  late String seed;
  late DateTime expirationDate;

  Seed fromJson(dynamic json) {
    seed = json['seed'] ?? 'default';
    // expirationDate = DateTime.now().add(Duration(seconds: 10));
    expirationDate = DateTime.tryParse(json['expiration']) ??
        DateTime.now().add(Duration(hours: 1));
    return Seed(expirationDate: expirationDate, seed: seed);
  }
}
