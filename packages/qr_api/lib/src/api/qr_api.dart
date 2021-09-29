import 'package:qr_api/src/api/api_result.dart';
import 'package:qr_models/qr_models.dart';

/// {@template qr_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class QrApi {
  ///
  Future<ApiResult<QRSeed>> fetchQrApi() async {
    try {
      await Future<dynamic>.delayed(const Duration(seconds: 1));
      final response = QRSeed(
          'd290ea3f83c4b1538a90ce36e741ef9b', '2021-09-28T02:35:36.334Z');
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(e);
    }
  }
}
