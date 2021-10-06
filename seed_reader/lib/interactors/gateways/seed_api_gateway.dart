import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../errors.dart';
import '../../models/seed.dart';

class SeedApiGateway {
  const SeedApiGateway({required http.Client client}) : _client = client;
  final http.Client _client;

  Future<Seed> fetchSeed() async {
    final Uri url = Uri.parse('https://seed-generator.herokuapp.com/api/seed');
    return _client.get(url).then((http.Response response) {
      if (response.statusCode == 200) {
        return Seed.fromJson(
          json.decode(response.body) as Map<String, dynamic>,
        );
      }
      throw FailToFetchSeed();
    });
  }
}
