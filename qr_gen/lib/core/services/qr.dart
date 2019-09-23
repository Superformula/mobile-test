import 'package:qr_gen/core/models/seed.dart';

abstract class QrService {
  getSeed();
}

class QrServiceImplementation extends QrService {
  Future<Seed> getSeed() async {
    return Seed.fromJson({
      'seed': '9b0a34057c9d302628e1d7ef50e37b08',
      'expires_at': DateTime.now().add(Duration(seconds: 45)).toIso8601String()
    });
  }
}
