import 'package:flutter/material.dart';
import 'package:mobile_test/src/screens/home_screen.dart';

void main() {
  runApp(QRCodeGeneratorAndScannerApp());
}

class QRCodeGeneratorAndScannerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
