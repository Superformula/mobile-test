import 'package:flutter/material.dart';

import '../app_route.dart';

class GenerateSeedRoute implements AppRoute {
  const GenerateSeedRoute();

  @override
  bool canHandle(String route) => route == '/generate_seed';

  @override
  Route<T> handle<T>(RouteSettings settings) {
    return MaterialPageRoute<T>(
      builder: (_) {
        return const Scaffold(
          body: Text('hello world'),
        );
      },
    );
  }
}
