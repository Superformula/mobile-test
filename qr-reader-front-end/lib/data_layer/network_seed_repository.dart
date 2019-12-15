import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superformula/data_layer/qr_seed.dart';
import 'package:superformula/data_layer/seed_respository.dart';

class NetworkSeedRepository implements SeedRepository {
  final host = 'http://localhost:8888';

  Future<QrSeed> fetchLatestSeed() async {
    final url = '$host/seed';

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final seed = QrSeed.fromJson(data);
    return seed;
  }
}
