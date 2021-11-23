import 'package:qr_generator/models/seed.dart';
import 'package:qr_generator/network/http_client.dart';

class _Urls {
  static const seedUrl = '192.168.1.235:8080/checkSeed';
}

class ScanRepository {
  final HttpClient _httpClient = HttpClient();

  Future<Object?> verifyQr(Seed request) async {
    final dynamic response = await _httpClient.postRequest("${_Urls.seedUrl}");

    try {
      return response;
    } catch (e) {
      return null;
    }
  }
}
