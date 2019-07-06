import 'package:flutter/material.dart';
import 'package:qr_generator/screens/home.dart';
import 'package:qr_generator/screens/display.dart';
import 'package:qr_generator/screens/scan.dart';

void main() => runApp(QrApp());

class QrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code App',
      theme: ThemeData(
        primaryColorDark: Color(0xFF7B1FA2),
        primaryColorLight: Color(0xFFE1BEE7),
        primaryColor: Color(0xFF9C27B0),
        accentColor: Color(0xFF7C4DFF),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/display': (context) => DisplayScreen(),
        '/scan': (context) => ScanScreen(),
      },
    );
  }
}
