import 'package:flutter/material.dart';
import 'package:qr_generator/providers/bloc-provider.dart';
import 'package:qr_generator/qr-generation/qr-generation-bloc.dart';
import 'package:qr_generator/qr-generation/qr-generation-screen.dart';
import 'package:qr_generator/router/app-route-table.dart';
import 'package:qr_generator/router/app-router.dart';

void main() {

  AppRouteTable routeTable = AppRouteTable();
  AppRouter router = AppRouter(routeTable);
  runApp(QRGeneratorApp(
    router
  ));
}

class QRGeneratorApp extends StatelessWidget {

  final AppRouter _router;

  QRGeneratorApp(this._router);

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

