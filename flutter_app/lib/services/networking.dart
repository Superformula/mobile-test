import 'package:http/http.dart' as http;

class NetworkingService {

  final String _apiBaseUrl = 'us-central1-robsonskyme.cloudfunctions.net';
  final String _apiPath = '/api';

  Future<http.Response> get(String path, Map<String, String> params) async {
    try {
      var uri = Uri.https(_apiBaseUrl, '$_apiPath$path', params);
      final response = await http.get(
          uri,
      );
      return response;
    } catch(e) {
      throw e;
    }
  }
}
