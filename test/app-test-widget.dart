import 'package:flutter/material.dart';

import 'app-mocks.dart';

class AppTestWidget {

  final Widget child;
  final MockNavigatorObserver mockNavigatorObserver;

  AppTestWidget({required this.child, required this.mockNavigatorObserver});

  Widget buildSut() {
    return MaterialApp(
      home: child,
      navigatorObservers: [mockNavigatorObserver],
    );
  }
}