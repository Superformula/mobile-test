import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:mobile_test/src/model/seed.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl = "https://generate-seed-api.herokuapp.com/api/v1/seed";

  Future<SeedResponse> fetchSeed() async {
    final response = await client.get("$_baseUrl");

    if (response.statusCode == 200) {
      return SeedResponse.fromJson(json.decode(response.body)[0]);
    } else {
      throw Exception('Failed to get response');
    }
  }
}
