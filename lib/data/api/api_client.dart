import 'package:http/http.dart';

abstract class RestApiClient {
  Future<dynamic> invokeApi(String path, String method);
}

/// The idea here is that this client can vary the REST API implementation (in this case the http library) without
/// requiring undue refactoring to its dependent app remote clients. It also makes this logic more reusable.
class ApiClient implements RestApiClient {
  String basePath;
  var client = Client();

  ApiClient({String basePath})
      : this.basePath = basePath ?? 'localhost:8000';

  Future<Response> invokeApi(String path, String method) {
    var url = Uri.http(basePath, path);

    switch(method) {
      case 'GET':
        return client.get(url);
      default:
        return client.head(url);
    }
  }
}