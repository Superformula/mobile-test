import 'package:qr_code/model/seed.dart';

class ApiClient {
  // TODO - Implement actual method
  Future<Seed> fetchSeed() => Future.delayed(Duration(seconds: 3), () => Seed(value: 'golden', expiresAt: DateTime.now().add(Duration(seconds: 15))));
}
