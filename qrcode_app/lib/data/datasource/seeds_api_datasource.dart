import 'dart:convert';

import 'package:qrcode_app/data/models/seed_model.dart';
import 'package:qrcode_app/domain/entities/seed.dart';
import 'package:http/http.dart' show Client;

class SeedApiDatasource {
  static const URL = 'http://10.0.0.172:8000';

  static Future<Seed> getSeed(Client client) async {
    final response =
        await client.get(Uri.https('seed-server.herokuapp.com', '/seed'));

    if (response.statusCode == 200) {
      return SeedModel().fromJson(json.decode(response.body));
    } else
      throw Exception('Failed to get API content');

    // return Future.delayed(Duration(seconds: 3)).then((value) => Seed(
    //     seed: 'asdhis',
    //     expirationDate: DateTime.now().add(Duration(seconds: 10))));
  }

  // static Future<Seed> getFakeSeed() async {
  //   return Future.delayed(Duration(seconds: 1))
  //       .then((value) => SeedModel().fromJson(json.decode(getRandString(8))));
  // }

  // static String getRandString(int len) {
  //   var random = Random.secure();
  //   var values = List<int>.generate(len, (i) => random.nextInt(255));
  //   return
  //   {
  //     'seed': ${base64UrlEncode(values)},
  //     'expiration': ${DateTime.now().add(Duration(seconds: 20))}
  //   };

  // }
}
