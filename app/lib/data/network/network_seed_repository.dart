import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qrgenerator/domain/abstractions/seed_repository.dart';
import 'package:qrgenerator/domain/models/seed.dart';
import 'package:qrgenerator/domain/models/serializers.dart';
import 'package:retry/retry.dart';

///
/// NetworkSeedRepository uses http server to read seed data.
///
class NetworkSeedRepository implements SeedRepository {
  @override
  Future<Seed> readSeed() async {
    final response = await retry(
      // Make a GET request
      () => http.get('https://us-central1-qrcode-server.cloudfunctions.net/seed').timeout(Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is TimeoutException,
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Seed seed = serializers.deserializeWith(Seed.serializer, body);
      print(seed.value);
      return seed;
    } else {
      throw Exception('Failed to fetch seed!');
    }
  }
}
