import 'package:dio/dio.dart';
import 'package:flutter_mobile_test/api/http_client.dart';

class QrCodeApi {
  final HttpClient _httpClient = HttpClient();

  Future<Response> get getApiQrCode => _httpClient.get("");

  Future<Response> get getMockApiQrCode => Future.delayed(
      Duration(seconds: 1),
      () => Response(
          data: Map.fromEntries(
              [MapEntry('seed', '9b0a34057c9d302628e1d7ef50e37b08')])));
}
