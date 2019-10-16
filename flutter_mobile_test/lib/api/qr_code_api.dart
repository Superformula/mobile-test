import 'package:dio/dio.dart';
import 'package:flutter_mobile_test/api/http_client.dart';

class QrCodeApi {
  final HttpClient _httpClient = HttpClient();

  Future<Response> getApiQrCode() => _httpClient.get("/seed");
}