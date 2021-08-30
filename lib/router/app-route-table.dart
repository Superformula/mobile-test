import 'package:flutter/material.dart';
import 'package:qr_generator/index/index-bloc.dart';
import 'package:qr_generator/index/index-screen.dart';
import 'package:qr_generator/permissions/permission-wrapper.dart';
import 'package:qr_generator/providers/bloc-provider.dart';
import 'package:qr_generator/qr-generation/qr-generation-bloc.dart';
import 'package:qr_generator/qr-generation/qr-generation-screen.dart';
import 'package:qr_generator/qr-scanning/qr-scanning-bloc.dart';
import 'package:qr_generator/qr-scanning/qr-scanning-screen.dart';
import 'package:qr_generator/services/app-backend-client.dart';

class AppRouteTable {

  AppBackendClient _backendClient;

  AppRouteTable(this._backendClient);

  WidgetBuilder? getRoute(
    String? routeName,
    Map<String, dynamic>? args
  ) {

    Map<String, WidgetBuilder> routes = {
      "/": (context) => BlocProvider(
        bloc: IndexBloc(),
        child: IndexScreen(permissionWrapper: PermissionWrapper())
      ),
      "/qr-generation": (context) {
        return BlocProvider(
          bloc: QRGenerationBloc(_backendClient),
          child: QRGenerationScreen(),
        );
      },
      "/qr-scan": (context) {
        return BlocProvider(
          bloc: QRScanningBloc(_backendClient),
          child: QRScanningScreen()
        );
      }
    };

    return routes[routeName];
  }
}