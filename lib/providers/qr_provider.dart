import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:uuid/uuid.dart';

class QRProvider extends ChangeNotifier {
  String? _code = '';
  String? get code => _code;

  Future<void> flipCamera(QRViewController controller) async {
    await controller.flipCamera();
  }

  String generateCode() {
    _code = Uuid().v4();
    notifyListeners();
    return _code!;
  }

  Future<void> pauseCamera(QRViewController controller) async {
    await controller.pauseCamera();
  }
}
