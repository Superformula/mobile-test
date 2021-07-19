import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class ClientMock extends Mock implements Client {
  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    return Response('{"seed": "random data", "expiresAt": "${DateTime.now()}"}', 200);
  }
}

class ClientErrorMock extends Mock implements Client {
  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    throw Exception();
  }
}