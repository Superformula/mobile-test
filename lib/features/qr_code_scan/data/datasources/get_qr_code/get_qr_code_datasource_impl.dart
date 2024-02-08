import 'package:dio/dio.dart';
import 'package:superformula_leandro/core/constants/strings_constants.dart';
import 'package:superformula_leandro/core/endpoints/endpoints.dart';
import 'package:superformula_leandro/core/errors/exceptions/api_exception.dart';
import 'package:superformula_leandro/core/errors/exceptions/generic_exception.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/models/qr_code_model.dart';

final class GetQrCodeDatasourceImpl implements GetQrCodeDatasource {
  const GetQrCodeDatasourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<QrCodeModel> call() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await _dio.get(Endpoints.seed);
      return QrCodeModel.fromMap(response.data);
    } on DioException catch (exception, stackTrace) {
      throw ApiException(
        message: exception.message ??
            StringsConstants.somethingWentWrongWithTheRequest,
        error: exception,
        stackTrace: stackTrace,
      );
    } catch (exception, stackTrace) {
      throw GenericException(
        error: exception,
        stackTrace: stackTrace,
      );
    }
  }
}
