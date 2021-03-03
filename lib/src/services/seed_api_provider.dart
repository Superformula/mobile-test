import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:mobile_test/src/model/seed.dart';
import 'package:mobile_test/src/services/custom_exceptions.dart';
import 'package:mobile_test/src/services/custom_http500_exception.dart';
import 'package:retry/retry.dart';

class SeedApiProvider {
  factory SeedApiProvider() {
    singleton ??= SeedApiProvider._internal();
    return singleton;
  }

  SeedApiProvider._internal();

  static SeedApiProvider singleton;

  Client client = Client();

  Future<SeedResponse> getSeedResponse() async {
    final dynamic _baseUrl = env['API_URL'];
    final dynamic _apiKey = env['API_KEY'];

    final Map<String, String> headers = <String, String>{
      'SEED_API_KEY': _apiKey
    };
    SeedResponse result;

    try {
      await retry<dynamic>(
        () async {
          final Response response =
              await client.get(_baseUrl, headers: headers);
          result = getResponse(response);
        },
        retryIf: (Exception e) => e is Http500Exception,
        maxAttempts: 3,
      );
      return result;
    } on Exception {
      rethrow;
    }
  }

  dynamic getResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return SeedResponse.fromJson(json.decode(response.body));
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      default:
        throw Http500Exception(
            'Error occured while Communication with Server with StatusCode',
            uri: Uri(path: env['API_URL']));
    }
  }
}
