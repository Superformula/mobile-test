import 'package:dio/dio.dart';
import 'package:qr_api/src/api/api_result.dart';
import 'package:qr_models/qr_models.dart';

/// {@template qr_api}
/// This works as a remote data source for the QrSeed requests
/// {@endtemplate}
class QrApi {
  /// Default construvctor with a [Dio] instance
  QrApi(this._dio);

  final Dio _dio;

  /// This return a [ApiResult] state with the model [QRSeed] as value
  Future<ApiResult<QRSeed>> fetchQrApi() async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/default/random-qr-seed_seed');
      final seed = QRSeed.fromJson(response.data!);
      return ApiResult.success(seed);
    } on Exception catch (e) {
      return ApiResult.failure(e);
    }
  }
}
