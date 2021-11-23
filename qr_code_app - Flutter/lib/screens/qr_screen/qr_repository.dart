import 'package:qr_generator/models/seed.dart';
import 'package:qr_generator/network/http_client.dart';
import 'package:qr_generator/providers/general.dart';

class _Urls {
  static const seedUrl = '192.168.1.235:8080/seed';
}

class QrRepository {
  final HttpClient _httpClient = HttpClient();

  Future<Seed?> getSeed(General general) async {
    final dynamic seedResponse = await _httpClient.getRequest(
      _Urls.seedUrl,
    );

    try {
      return Seed.fromJson(seedResponse);
    } catch (e) {
      return null;
    }
  }
}
