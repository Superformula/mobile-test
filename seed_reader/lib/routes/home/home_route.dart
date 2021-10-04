import 'package:flutter/material.dart';
import '../../routes/home/home_page.dart';
import '../app_route.dart';

class HomeRoute implements AppRoute {
  const HomeRoute();

  @override
  bool canHandle(String route) => route == '/home';

  @override
  Route<T> handle<T>(RouteSettings settings) {
    return MaterialPageRoute<T>(
      builder: (_) => const HomePage(),
    );
  }
}
