import 'package:flutter/material.dart';
import 'package:superformula_leandro/core/routes/named_routes.dart';
import 'package:superformula_leandro/core/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Superformula Leandro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: Routes.allRoutes(context),
      initialRoute: NamedRoutes.home,
    );
  }
}
