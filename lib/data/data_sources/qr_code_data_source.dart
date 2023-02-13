import 'dart:math';

import 'package:dio/dio.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/model/qr_code_model.dart';
import 'package:superformula_test/data/resources/api.dart';

abstract class QRCodeDataSource {
  Future<QRCodeModel> getSeed();
  Future<bool> validateQRCode();
}

class QRCodeDataSourceImpl implements QRCodeDataSource {
  final AppApi<Response> api;

  QRCodeDataSourceImpl(this.api);

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
    await Future.delayed(const Duration(seconds: 2));
    return Random().nextBool();
  }
}
