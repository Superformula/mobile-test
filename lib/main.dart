import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superformula_challenge/repositories/repositories.dart';
import 'package:superformula_challenge/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        var route;
        switch (settings.name) {
          case Dashboard.route:
            {
              route = Dashboard();
            }
        }
        return MaterialPageRoute(
          builder: (_) => route,
          settings: settings,
        );
      },
      builder: (context, child) {
        return RepositoryProvider<QrRepository>(
          lazy: false,
          create: (context) => QrRepository(),
          child: child,
        );
      },
    );
  }
}
