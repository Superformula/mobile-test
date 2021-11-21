import 'package:flutter/material.dart';
import 'package:superformula_qr_code/screens/home_screen.dart';
import 'package:superformula_qr_code/shared/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (route) {
        print('route name => ${route.name}');
        return Routing().getRoutes(route);
      },
      home: const HomeScreen(),
    );
  }
}
