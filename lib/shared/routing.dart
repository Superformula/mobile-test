import 'package:flutter/material.dart';
import 'package:superformula_qr_code/screens/home_screen.dart';
import 'package:superformula_qr_code/screens/qr_code_screen.dart';
import 'package:superformula_qr_code/screens/scan_screen.dart';
import 'package:superformula_qr_code/shared/app_routes.dart';

class Routing {
  Route getRoutes(RouteSettings routes) {
    switch (routes.name) {
      case AppRoutes.homeScreen:
        return routeAnimation(
          page: const HomeScreen(),
        );

      case AppRoutes.qrCodeScreen:
        return routeAnimation(
          page: const QrCodeScreen(),
        );
      case AppRoutes.scanScreen:
        return routeAnimation(
          page: const ScanScreen(),
          offset: const Offset(0, 1),
        );
      default:
        return routeAnimation(
          page: const HomeScreen(),
        );
    }
  }

  Route routeAnimation({page, Offset? offset}) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 350),
      barrierColor: Colors.black54,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = offset ?? const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
