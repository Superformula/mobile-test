import 'package:dio/dio.dart';

class ApiClient {
  late Dio dio;
  ApiClient() {
    setupDio();
  }

  setupDio() async {
    // Change baseUrl  to localhost:3030 if you are using iOS Simulator,
    // on android use the local ip
    BaseOptions options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      baseUrl: 'http://192.168.86.45:3030/', //192.168.86.30
    );
    dio = Dio(options);
  }

//Dynamic get
  Future<dynamic> getDio(String url, {Map<String, dynamic>? parameters}) async {
    dynamic response = await dio.get(
      url,
      queryParameters: parameters,
    );
    return response;
  }

  // Dynamic post
  Future<dynamic> postDio(String url, {data}) async {
    dynamic response = await dio.post(
      url,
      data: data,
    );
    return response;
  }
}
