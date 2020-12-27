import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:superformula_challenge/models/models.dart';

class QrRepository {
  // API paths
  final apiUrl = 'http://localhost:3000';
  static const seedEndpoint = '/seed';

  // HTTP configuration
  Dio dio;
  static const timeoutMs = 5000;
  HttpClientAdapter httpClientAdapter;

  QrRepository({
    // HttpClientAdapter can be provided and used as a mock HTTP client
    this.httpClientAdapter,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
      ),
    );
    if (httpClientAdapter != null) {
      dio.httpClientAdapter = httpClientAdapter;
    }
  }

  Future getSeed() async {
    var response = await get(url: seedEndpoint);

    if (response is Map) {
      return Seed.fromJson(response);
    }
    return response;
  }

  Future get({
    @required String url,
  }) async {
    try {
      return await dio
          .get(
            url,
          )
          .then((response) =>
              // HttpClientAdapter produces String data, so decode that
              response is String ? jsonDecode(response.data) : response.data)
          .timeout(Duration(milliseconds: timeoutMs), onTimeout: () {});
    } on DioError catch (error) {
      return error;
    }
  }
}
