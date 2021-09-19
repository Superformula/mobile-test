// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../presentation/home/home_screen.dart' as _i3;
import '../presentation/qr_generator/generator_screen.dart' as _i5;
import '../presentation/qr_scanner/scanner_screen.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomeScreen();
        }),
    QRScannerRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.QRScannerScreen();
        }),
    QRGeneratorRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.QRGeneratorScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(QRScannerRoute.name, path: '/q-rscanner-screen'),
        _i1.RouteConfig(QRGeneratorRoute.name, path: '/q-rgenerator-screen')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

class QRScannerRoute extends _i1.PageRouteInfo {
  const QRScannerRoute() : super(name, path: '/q-rscanner-screen');

  static const String name = 'QRScannerRoute';
}

class QRGeneratorRoute extends _i1.PageRouteInfo {
  const QRGeneratorRoute() : super(name, path: '/q-rgenerator-screen');

  static const String name = 'QRGeneratorRoute';
}
