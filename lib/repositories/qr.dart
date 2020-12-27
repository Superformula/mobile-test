import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:superformula_challenge/models/models.dart';

class QrRepository {
  // API paths
  final apiUrl = 'http://localhost:3000';
  static const seedEndpoint = '/seed';
  static const validateEndpoint = '/validate';

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

  Future validateSeed({
    @required String seed,
  }) async {
    // If a validate endpoint were implemented, this is how it would be used:
    //    return await post(url: validateEndpoint, data: seed);
    // The API would find the Seed object based on the seed value provided
    // and return true if the current time is before the Seed's expire_at.
    // Since the API endpoint is outside the scope of the challenge, the
    // Seed validity will be always be true
    return true;
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
              response.data is String
                  ? jsonDecode(response.data)
                  : response.data)
          .timeout(Duration(milliseconds: timeoutMs), onTimeout: () {
        return DioError(
          error: 'Connection timed out',
          type: DioErrorType.RECEIVE_TIMEOUT,
        );
      });
    } on DioError catch (error) {
      return error;
    }
  }

  Future post({
    @required String url,
    Map<String, dynamic> data,
  }) async {
    try {
      await dio
          .post(
            url,
            data: data,
          )
          .then((response) => response.data
                  .timeout(Duration(milliseconds: timeoutMs), onTimeout: () {
                return DioError(
                  error: 'Connection timed out',
                  type: DioErrorType.RECEIVE_TIMEOUT,
                );
              }));
    } on DioError catch (error) {
      return error;
    }
  }
}
