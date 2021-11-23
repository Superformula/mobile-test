import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:qr_generator/providers/general.dart';
import 'package:qr_generator/screens/qr_screen/qr_view_model.dart';

import 'general/routes.dart';

void main() {
  getProviders() {
    return [
      ChangeNotifierProvider(create: (_) => General()),
      ChangeNotifierProvider(create: (_) => QrViewModel())
    ];
  }

  runApp(
    MultiProvider(
      providers: getProviders(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Generator',
      routes: Routes.getRoutes(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Home',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
          ),
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          backgroundColor: Colors.blue,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.qr_code),
                label: 'QR Code',
                onTap: () {
                  Navigator.pushNamed(context, Routes.qrScreen);
                }),
            SpeedDialChild(
                child: const Icon(Icons.camera_alt),
                label: 'Scan',
                onTap: () {
                  Navigator.pushNamed(context, Routes.scanScreen);
                }),
          ],
        ));
  }
}

class MyProxyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "192.168.1.235:8080";
      }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
