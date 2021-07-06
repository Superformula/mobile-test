import 'dart:convert';
import 'package:qrcode_app/data/models/seed_mapper.dart';
import 'package:qrcode_app/data/models/seed_model.dart';
import 'package:qrcode_app/domain/entities/seed.dart';
import 'package:http/http.dart' show Client;

class SeedApiDatasource {
  Future<Seed> getSeed(Client client) async {
    final response =
        await client.get(Uri.https('seed-server.herokuapp.com', '/seed'));

    if (response.statusCode == 200) {
      return SeedMapper().toSeed(SeedDto.fromJson(json.decode(response.body)));
    } else
      throw Exception('Failed to get API content');
  }
}
