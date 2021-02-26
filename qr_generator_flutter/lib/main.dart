import 'package:flutter/material.dart';

import 'package:qr_generator_flutter/src/app.dart';
import 'package:qr_generator_flutter/src/core/dependency_injection.dart';

void main() async {
  await setUpDI();
  runApp(QrGeneratorApp());
}
