import 'package:flutter/material.dart';
import 'package:flutter_app/screens/generate_qr_code/generate_qr_code_screen.dart';
import 'package:flutter_app/screens/home/home_screen.dart';

const String GenerateQRCodeScreenRoute = 'generate';
const String ScanQRCodeScreenRoute = 'scan';
const String HomeScreenRoute = '/';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case GenerateQRCodeScreenRoute:
      return MaterialPageRoute(builder: (context) => GenerateQRCodeScreen.create());
    case ScanQRCodeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}