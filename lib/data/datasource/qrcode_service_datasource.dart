import 'dart:math';

import 'package:qrtestcodeone/data/datasource/api/qrcode_api_service.dart';
import 'package:qrtestcodeone/data/model/qr_seed_datamodel.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

abstract class QrCodeServiceDataSource {
  Future<QrSeedDataModel> getSeed();
}

class QrCodeServiceDataSourceImpl extends QrCodeServiceDataSource {
  final QrCodeApiService qrApi;
  final values = [
    'Pablo Testing!',
    'Pablo - Coding',
    'Pablo - TestingQR',
    'Pablo - Tests',
    'Pablo - HeyThere',
    'Pablo - Endpoint',
    'Pablo - API',
  ];

  QrCodeServiceDataSourceImpl(this.qrApi);

  @override
  Future<QrSeedDataModel> getSeed() {
    final result = values[Random().nextInt(values.length)];
    return qrApi.getSeed(result);
  }
}
