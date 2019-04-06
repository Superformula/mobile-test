import 'package:flutter/material.dart';
import 'package:qrcode/core/bloc.dart';
import 'package:qrcode/env/env.dart';
import 'package:qrcode/ui/home_screen.dart';
import 'package:qrcode/ui/qrcode_screen.dart';
import 'package:qrcode/ui/scan_screen.dart';

void main() => runApp(
    QRCodeApp()
);

class QRCodeApp extends StatelessWidget {

  static const NAV_SCAN_SCREEN = "scan_screen";
  static const NAV_QRCODE_SCREEN = "qrcode_screen";

  @override
  Widget build(BuildContext context) {

    // set the environment for the app
    Env env = DevEnv();

    return MaterialApp(
      title: 'QRCode App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Home'),
      routes: {
        NAV_SCAN_SCREEN: (context) => ScanScreen(),
        NAV_QRCODE_SCREEN: (context) => BlocProvider<QRCodeScreenBloc>(bloc: QRCodeScreenBloc(env), child: QRCodeScreen())
      },
    );
  }
}