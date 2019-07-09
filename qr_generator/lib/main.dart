import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_generator/models/seed.dart';
import 'package:qr_generator/screens/home_screen/index.dart';
import 'package:qr_generator/screens/display_screen/index.dart';
import 'package:qr_generator/screens/scan_screen/index.dart';

void main() => runApp(QrApp());

class QrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => Seed(),
      child: MaterialApp(
        title: 'QR Code App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/display': (context) => DisplayScreen(),
          '/scan': (context) => ScanScreen(),
        },
      ),
    );
  }
}
