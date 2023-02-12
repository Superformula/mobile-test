import 'package:dio/dio.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/model/qr_code_seed_model.dart';
import 'package:superformula_test/data/resources/api.dart';

abstract class QrCodeSeedDataSource {
  Future<QrCodeSeedModel> getSeed();
}

class QrCodeSeedDataSourceImpl implements QrCodeSeedDataSource {
  final AppApi<Response> api;

  QrCodeSeedDataSourceImpl(this.api);

  @override
  Future<QrCodeSeedModel> getSeed() async {
    try {
      final apiResponse = await api.get('/seed');

      return QrCodeSeedModel.fromJson(apiResponse.response.data['content']);
    } on DioError catch (e) {
      throw DataSourceException(
        error: e,
        message: 'Error getting the QR Code seed from the API.',
      );
    }
  }
}
