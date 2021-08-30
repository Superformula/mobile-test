import 'package:flutter/material.dart';
import 'package:qr_generator/providers/bloc-provider.dart';
import 'package:qr_generator/qr-generation/qr-generation-bloc.dart';
import 'package:qr_generator/qr-generation/qr-generation-screen.dart';
import 'package:qr_generator/router/app-route-table.dart';
import 'package:qr_generator/router/app-router.dart';
import 'package:qr_generator/services/app-backend-client.dart';

void main() {

  AppBackendClient backendClient = AppBackendClient.getInstance();
  AppRouteTable routeTable = AppRouteTable(backendClient);
  AppRouter router = AppRouter(routeTable);
  runApp(QRGeneratorApp(
    router,
    backendClient
  ));
}

class QRGeneratorApp extends StatelessWidget {

  final AppRouter _router;
  final AppBackendClient backendClient;

  QRGeneratorApp(
    this._router, 
    this.backendClient
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: _router.route,
    );
  }
}

