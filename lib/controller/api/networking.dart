import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:flutter/material.dart';
import 'package:qr_test/model/constants.dart';
import 'package:qr_test/model/data_seed.dart';

class Networking {
  Client client = Client();

  Future<DataSeed?> getSeed(BuildContext context) async {
    //Sets URI to base url + specific route
    Uri url = Uri.parse(testUrl);

    Map<String, String> headers = {'x-api-key': testKey};

    final response = await client.get(url, headers: headers);

    if (response.statusCode == 200) {
      DataSeed data = DataSeed.fromJson(json.decode(response.body));

      return data;
    } else {
      throw (Exception);
    }
  }
}
