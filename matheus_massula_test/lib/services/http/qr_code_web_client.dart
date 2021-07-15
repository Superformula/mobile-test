import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import 'interceptors/qr_code_interceptor.dart';

class QRCodeWebClient {
  final Client client = InterceptedClient.build(
    interceptors: [QRCodeInterceptor()],
    requestTimeout: Duration(seconds: 15)
  );
  final String url = ''; //TODO: replace the URL received from Superformula here
  
  Future<dynamic> getQRCode() async {
    final Response response = await client.get(Uri.parse(url));
  }
}
