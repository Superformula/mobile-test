import 'package:flutter/material.dart';

class TestWrapper extends StatelessWidget {
  final Widget child;
  TestWrapper(this.child);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Wrapper',
      home: child,
    );
  }
}
