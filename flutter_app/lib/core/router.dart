import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/home_screen.dart';

const String CreateQRCodeScreenRoute = 'create';
const String ScanQRCodeScreenRoute = 'scan';
const String HomeScreenRoute = '/';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case CreateQRCodeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case ScanQRCodeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}