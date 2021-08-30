 import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
 
 class AppHttpClient extends BaseClient {

  late IOClient _httpClient;

  AppHttpClient() {
    HttpClient httpClient = HttpClient();
    // can configure http client here
    _httpClient = new IOClient(httpClient);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
     return _httpClient.send(request);
  }
 }