import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:qrcodevalidator/app/pages/display_qr_code/display_qr_code_view.dart';
import 'package:qrcodevalidator/app/pages/home/home_page.dart';
import 'package:qrcodevalidator/app/pages/scan_qr_code/scan_qr_code_view.dart';

void main() {
  if (kDebugMode) {
    FlutterCleanArchitecture.debugModeOn();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code validator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/ScanQRCode': (_) => ScanQRCodeView(),
        '/DisplayQRCode': (_) => DisplayQRCodeView()
      },
    );
  }
}
