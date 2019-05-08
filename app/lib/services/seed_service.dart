import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:supercode/models.dart';

class SeedService {
  http.Client _client;
  String _host;

  SeedService({@required String host, http.Client client}) {
    _host = host;
    _client = client ?? http.Client();
  }

  /// Fetches a [Seed] from the server
  Future<Seed> fetchSeed() async {
    final response = await _client.get('$_host/seed');
    if (response.statusCode == 200) {
      return Seed.fromJson(json.decode(response.body));
    } else {
      throw new Exception("Error fetching seed");
    }
  }
}
