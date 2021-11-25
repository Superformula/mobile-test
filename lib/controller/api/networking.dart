import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:qr_test/model/constants.dart';

import 'package:qr_test/model/data_seed.dart';

abstract class Networking {
  ///Gets
  Future<DataSeed> getSeed();
}

class NetworkingImpl extends Networking {
  final Client client;
  NetworkingImpl({required this.client});

  @override
  Future<DataSeed> getSeed() async {
    Uri url = Uri.parse(testUrl);

    Map<String, String> headers = {"x-api-key": testKey};

    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      DataSeed data = DataSeed.fromJson(json.decode(response.body));

      return data;
    } else {
      throw (Exception);
    }
  }
}
