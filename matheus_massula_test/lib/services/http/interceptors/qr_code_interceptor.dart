import 'package:http_interceptor/http_interceptor.dart';

class QRCodeInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request baseUrl: ${data.baseUrl}');
    print('Request headers: ${data.headers}');
    print('Request body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response statusCode: ${data.statusCode}');
      print('Response headers: ${data.headers}');
      print('Response body: ${data.body}');
      return data;
  }
}
