import 'dart:math';

import 'package:dio/dio.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/model/qr_code_model.dart';
import 'package:superformula_test/data/resources/api.dart';

abstract class QRCodeRemoteDataSource {
  const QRCodeRemoteDataSource();

  Future<QRCodeModel> getSeed();
  Future<bool> validateQRCode();
}

class QRCodeRemoteDataSourceImpl implements QRCodeRemoteDataSource {
  final AppApi<Response> api;

  const QRCodeRemoteDataSourceImpl(this.api);

  @override
  Future<QRCodeModel> getSeed() async {
    try {
      final apiResponse = await api.get('/seed');

      return QRCodeModel.fromJson(apiResponse.response.data['content']);
    } on DioError catch (e) {
      throw DataSourceException(
        error: e,
        message: 'Error getting the QR Code seed from the API.',
      );
    }
  }

  @override
  Future<bool> validateQRCode() async {
    // This should be an API call. That is why this method is in the remote data source.
    await Future.delayed(const Duration(seconds: 2));
    return Random().nextBool();
  }
}
