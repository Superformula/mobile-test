import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class HttpClient {
  HttpClient._privateConstructor();
  bool refreshTokenInProgress = false;

  static final HttpClient _instance = HttpClient._privateConstructor();

  factory HttpClient() {
    return _instance;
  }

  Future<dynamic> getRequest(
    String path,
  ) async {
    Response response;

    response = await get(Uri.http("192.168.1.235:8080", "/seed"));

    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 299) {
      if (response.body.isEmpty) {
        return [dynamic];
      } else {
        return jsonDecode(response.body);
      }
    } else {
      print("Error with status: ${response.statusCode}");
    }
  }

  Future<dynamic> postRequest(
    String path,
  ) async {
    Response response;

    response = await get(Uri.http("192.168.1.235:8080", "/checkSeed"));

    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 299) {
      if (response.body.isEmpty) {
        return [dynamic];
      } else {
        return jsonDecode(response.body);
      }
    } else {
      print("Error with status: ${response.statusCode}");
    }
  }
}
