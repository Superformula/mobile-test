import 'package:flutter/material.dart';
import 'package:qr_code/home/home_page.dart';

class QrCodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
