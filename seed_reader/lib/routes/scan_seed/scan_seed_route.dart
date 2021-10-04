import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../app_route.dart';

class ScanRoute implements AppRoute {
  const ScanRoute();

  @override
  bool canHandle(String route) => route == '/scan';

  @override
  Route<T> handle<T>(RouteSettings settings) {
    return MaterialPageRoute<T>(
      builder: (BuildContext context) {
        return Scaffold(
          body: Text(S.of(context).scanPageTitle),
        );
      },
    );
  }
}
