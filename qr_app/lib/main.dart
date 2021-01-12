import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/home/home_screen.dart';
import 'package:qr_app/routes.dart';

import 'data/models/qr_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<QrModel>(create: (_) => QrModel())],
        child: MaterialApp(
          title: 'Qr App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: Routes.generateRoute,
          home: HomeScreen(title: 'Home'),
        ));
  }
}
