import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:superformula_test/data/errors/exception.dart';
import 'package:superformula_test/data/model/qr_code_model.dart';

abstract class QRCodeLocalDataSource {
  Future<QRCodeModel> getSeed();
}

class QRCodeLocalDataSourceImpl implements QRCodeLocalDataSource {
  @override
  Future<QRCodeModel> getSeed() async {
    try {
      final seed = (Random().nextDouble() + 1).toString().substring(2);
      final expiresAt = DateTime.now()..add(const Duration(minutes: 1));

      return SynchronousFuture(QRCodeModel(seed: seed, expiresAt: expiresAt));
    } on Exception catch (e) {
      throw DataSourceException(
        error: e,
        message: 'Error getting the QR Code from local source',
      );
    }
  }
}
