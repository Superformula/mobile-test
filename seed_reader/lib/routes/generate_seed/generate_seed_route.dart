import 'package:flutter/material.dart';
import '../../routes/generate_seed/generate_seed_page.dart';
import '../app_route.dart';

class GenerateSeedRoute implements AppRoute {
  const GenerateSeedRoute();

  @override
  bool canHandle(String route) => route == '/generate_seed';

  @override
  Route<T> handle<T>(RouteSettings settings) {
    return MaterialPageRoute<T>(
      builder: (_) => const GenerateSeedPage(),
    );
  }
}
