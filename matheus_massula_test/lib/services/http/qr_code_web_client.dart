import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:matheus_massula_test/models/remote/qr_code_seed.dart';

import 'interceptors/qr_code_interceptor.dart';

class QRCodeWebClient {
  final Client client = InterceptedClient.build(
    interceptors: [QRCodeInterceptor()],
    requestTimeout: Duration(seconds: 15)
  );
  final String url = 'https://8mpaf1q1g5.execute-api.us-west-1.amazonaws.com/';
  
  Future<QRCodeSeed?>? getQRCode() async {
    final headers = {'x-api-key': 'VVTUTAdalB55yRKQzsM7u6RTowrcUUhJLA82hoN6'};

    final Response response = await client.get(
      Uri.parse(url + 'default/random-qr-seed_seed'),
      headers: headers
    );

    return QRCodeSeed.fromJson(jsonDecode(response.body));
  }
}
