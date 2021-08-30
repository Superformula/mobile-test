import 'package:flutter/material.dart';
import 'package:qr_generator/router/app-route-table.dart';
import 'package:qr_generator/router/app-router.dart';
import 'package:qr_generator/services/app-backend-client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      title: 'QR Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: _router.route,
    );
  }
}

