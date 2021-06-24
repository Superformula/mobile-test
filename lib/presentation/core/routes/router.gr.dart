// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../home/home_page.dart' as _i3;
import '../../qr_code/qr_code_page.dart' as _i4;
import '../../scan/scan_page.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    QRCodeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.QRCodePage();
        }),
    ScanRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.ScanPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(QRCodeRoute.name, path: '/qr-code'),
        _i1.RouteConfig(ScanRoute.name, path: '/scan')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

class QRCodeRoute extends _i1.PageRouteInfo {
  const QRCodeRoute() : super(name, path: '/qr-code');

  static const String name = 'QRCodeRoute';
}

class ScanRoute extends _i1.PageRouteInfo {
  const ScanRoute() : super(name, path: '/scan');

  static const String name = 'ScanRoute';
}
