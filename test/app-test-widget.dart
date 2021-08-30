import 'package:flutter/material.dart';

import 'app-mocks.dart';

class AppTestWidget {

  // widget actually being tested
  final Widget child;
  // navigation observer to be subscribed to app navigation changes
  // for test verifications
  final MockNavigatorObserver mockNavigatorObserver;
  // routes to pass in to Material App so navigation can be tested
  final Map<String, WidgetBuilder>? routes;

  AppTestWidget({required this.child, required this.mockNavigatorObserver, this.routes});

  Widget buildSut() {
    return MaterialApp(
      home: child,
      navigatorObservers: [mockNavigatorObserver],
      routes: routes ?? {},
    );
  }
}