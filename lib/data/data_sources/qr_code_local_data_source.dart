import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:superformula_test/data/model/qr_code_model.dart';

abstract class QRCodeLocalDataSource {
  const QRCodeLocalDataSource();

  Future<QRCodeModel> getSeed();
}

class QRCodeLocalDataSourceImpl implements QRCodeLocalDataSource {
  const QRCodeLocalDataSourceImpl();

  @override
  Future<QRCodeModel> getSeed() {
    final seed = (Random().nextDouble() + 1).toString().substring(2);
    final expiresAt = DateTime.now().add(const Duration(minutes: 1));

    return SynchronousFuture(QRCodeModel(seed: seed, expiresAt: expiresAt));
  }
}
