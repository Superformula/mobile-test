import 'package:superformula_leandro/core/errors/exceptions/qr_code_exception.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/datasources/get_qr_code/get_qr_code_datasource.dart';
import 'package:superformula_leandro/features/qr_code_scan/data/models/qr_code_model.dart';

final class GetQrCodeDatasourceImpl implements GetQrCodeDatasource {
  const GetQrCodeDatasourceImpl();
  @override
  Future<QrCodeModel> call() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final Map<String, dynamic> responseMap = <String, dynamic>{
        'seed': 'd43397d129c3de9e4b6c3974c1c16d1f',
        'expires_at': DateTime.now().add(const Duration(seconds: 60)),
      };
      return QrCodeModel.fromMap(responseMap);
    } catch (exception, stackTrace) {
      throw QrCodeException(
        message: 'Something went wrong. Try again later.',
        error: exception,
        stackTrace: stackTrace,
      );
    }
  }
}
