import 'package:flutter/material.dart';
import '../../routes/scan_seed/scan_seed_page.dart';
import '../app_route.dart';

class ScanRoute implements AppRoute {
  const ScanRoute();

  @override
  bool canHandle(String route) => route == '/scan';

  @override
  Route<T> handle<T>(RouteSettings settings) {
    return MaterialPageRoute<T>(
      builder: (BuildContext context) => const ScanSeedPage(),
    );
  }
}
