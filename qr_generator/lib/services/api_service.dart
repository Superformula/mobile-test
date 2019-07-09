import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const BASE_API_URL =
      'https://us-central1-qr-scanner-a71db.cloudfunctions.net/api';

  static Future<dynamic> _get(String url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Unable to load $url');
      }
    } catch (ex) {
      return throw Exception(ex);
    }
  }

  static Future<Map<String, dynamic>> getSeed() async {
    return await _get('$BASE_API_URL/seed');
  }
}
