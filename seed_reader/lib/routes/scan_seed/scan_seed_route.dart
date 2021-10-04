import 'package:flutter/material.dart';

import '../app_route.dart';

class ScanSeedRoute implements AppRoute {
  const ScanSeedRoute();

  @override
  bool canHandle(String route) => route == '/scan_seed';

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
