import 'package:flutter/material.dart';
import 'package:qr_code/qr_code_app.dart';
import 'package:qr_code/redux/store.dart';

void main() {
  final store = createReduxStore();
  runApp(QrCodeApp(store));
}
