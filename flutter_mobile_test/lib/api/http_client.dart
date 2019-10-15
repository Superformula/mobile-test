import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpClient {
  static const _baseUrl = "";
  final _client = Dio();

  HttpClient({Interceptor interceptor}) {
    _client.options.baseUrl = _baseUrl;
    _client.interceptors.add(_loggingInterceptor());

    if (interceptor != null) {
      _client.interceptors.add(interceptor);
    }
  }

  Future<Response> get(String path,
          {Map<String, String> headers = const {},
          Map<String, String> parameters = const {}}) =>
      _client.get(path,
          queryParameters: parameters, options: Options(headers: headers));

  Interceptor _loggingInterceptor() => InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          debugPrint(
              "Request: ${options.path}\n${options.headers.toString()}${options.queryParameters}\n"
              "body:${options.data}");
          return options;
        },
        onResponse: (Response response) {
          debugPrint(
              "Response: (${response.statusCode}) ${response.request.path}\n${response.data.toString()}");
          return response;
        },
        onError: (DioError error) {
          debugPrint("Response error: ${error.message}");
        },
      );
}
