class AppEndpoint {
  
  final String host;
  final String resource;
  String? path;
  Map<String, dynamic>? queryParams;

  AppEndpoint({required this.host, required this.resource});

  Uri toUri() {
    if(path != null) {
      return Uri.http(
          host,
          resource + path!,
          queryParams
        );
    } else {
      throw Exception("Url path cannot be null");
    }
  }

  AppEndpoint buildPath({String? path, Map<String, dynamic>? queryParams}) {
    AppEndpoint endpoint = AppEndpoint(host: this.host, resource: this.resource);
    endpoint.path = path;
    endpoint.queryParams = queryParams;
    return endpoint;
  }
}