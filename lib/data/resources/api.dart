import 'package:dio/dio.dart';
import 'package:superformula_test/data/resources/api_response.dart';

abstract class AppApi<T> {
  Future<ApiResponse<T>> get(String path);
}

class AppApiImpl implements AppApi<Response> {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://superformulaserver.herokuapp.com'),
  );

  @override
  Future<ApiResponse<Response>> get(String path) async {
    final response = await _dio.get(path);

    return ApiResponse(response: response);
  }
}
