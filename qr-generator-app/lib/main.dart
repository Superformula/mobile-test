import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_generator_app/app/qr_generator_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: QrGeneratorApp(),
    ),
  );
}
