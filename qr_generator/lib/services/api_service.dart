import 'dart:convert';
import 'package:http/http.dart' show Client;

class ApiService {
  static const BASE_API_URL =
      'https://us-central1-qr-scanner-a71db.cloudfunctions.net/api';

  static Future<dynamic> _get({Client client, String url}) async {
    client ??= Client();
    try {
      final response = await client.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Unable to load $url');
      }
    } catch (ex) {
      return throw Exception(ex);
    }
  }

  static Future<Map<String, dynamic>> getSeed({Client client}) async {
    return await _get(client: client, url: '$BASE_API_URL/seed');
  }
}
