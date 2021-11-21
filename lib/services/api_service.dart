import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superformula_qr_code/models/seed_model.dart';

class ApiService {
  Future<SeedModel> getSeed(http.Client client) async {
    final response = await client.get(
      Uri.parse('http://192.168.1.242:8000/seed'),
    );

    if (response.statusCode == 200) {
      // parse json if server returns 200 OK response
      return SeedModel.fromJson(jsonDecode(response.body));
    } else {
      // throw an exception if server does not return 200
      throw Exception('Failed to create seed');
    }
  }
}
