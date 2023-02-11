import 'package:flutter/material.dart';
import 'package:superformula_test/core/resources/app_routes.dart';
import 'package:superformula_test/core/theme/app_theme.dart';
import 'package:superformula_test/view/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      home: const HomePage(),
      routes: AppRoutes.routes,
    );
  }
}
