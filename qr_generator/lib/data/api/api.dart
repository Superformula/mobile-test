import 'package:http/http.dart' as http;

abstract class QRApi {
  Future<http.Response> generateQR();
}

class QRApiImpl implements QRApi {
  final String _baseUrl = '8mpaf1q1g5.execute-api.us-west-1.amazonaws.com';
  final String _urlPath = '/default/random-qr-seed_seed';
  final Map<String, String> _headers = {
    // This value isn't hidden to ease testing of the SF exercise
    "x-api-key": "VVTUTAdalB55yRKQzsM7u6RTowrcUUhJLA82hoN6"
  };

  @override
  Future<http.Response> generateQR() async {
    Uri url = Uri.https(_baseUrl, _urlPath);
    Map<String, String> headers = _headers;

    return await http.get(
      url,
      headers: headers,
    );
  }
}
