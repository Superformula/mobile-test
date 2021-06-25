import 'dart:convert';
import 'dart:io';

import 'dart:math';

Future<void> main() async {
  final server = await createServer();
  print('Server started: ${server.address} port ${server.port}');
  await handleRequests(server);
}

Future<HttpServer> createServer() async {
  final address = InternetAddress.loopbackIPv4.address;
  const port = 8080;
  return await HttpServer.bind(address, port);
}

Future<void> handleRequests(HttpServer server) async {
  await for (HttpRequest request in server) {
    switch (request.method) {
      case 'GET':
        handleGet(request);
        break;

      default:
        returnJson(request, HttpStatus.noContent);
    }
  }
}

void handleGet(HttpRequest request) {
  final path = request.uri.path;
  switch (path) {
    case '/seed':
      returnJson(request, HttpStatus.ok);
      return;
      break;
    default:
      returnJson(request, HttpStatus.noContent);
      return;
  }
}

void returnJson(HttpRequest request, int status) {
  dynamic response = {'seed': getRandString(8)};
  final jsonString = jsonEncode(response);
  request.response
    ..statusCode = status
    ..write(jsonString)
    ..close();
}

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
