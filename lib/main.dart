import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:mobile_test/src/screens/home_screen.dart';

// ignore: avoid_void_async
void main() async {
  await dot_env.load(fileName: '.env');
  runApp(QRCodeGeneratorAndScannerApp());
}

class QRCodeGeneratorAndScannerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
