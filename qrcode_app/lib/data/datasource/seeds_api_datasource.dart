import 'dart:convert';

import 'package:qrcode_app/data/models/seed_model.dart';
import 'package:qrcode_app/domain/entities/seed.dart';
import 'package:http/http.dart' show Client;

class SeedApiDatasource {
  static const URL = 'http://127.0.0.1:8080/seed';

  static Future<Seed> getSeed() async {
    Client client = Client();
    try {
      final response =
          await client.get(new Uri.http("127.0.0.1:8080", "/seed"));

      if (response.statusCode == 200) {
        return SeedModel().fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to get API content');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    // return Future.delayed(Duration(seconds: 3)).then((value) => Seed(
    //     seed: 'asdhis',
    //     expirationDate: DateTime.now().add(Duration(seconds: 10))));
  }
}
