import 'package:flutter/material.dart';
import 'package:qr_generator_app/app/routes.dart';

class QrGeneratorApp extends StatelessWidget {
  const QrGeneratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: AppRoutes.home,
      routes: routes,
    );
  }
}
