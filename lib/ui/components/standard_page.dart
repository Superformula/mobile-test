import 'package:flutter/material.dart';

/// The StandardPage widget is a common widget used within all pages. It helps
/// maintain common themeing between pages.
class StandardPage extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? floatingActionButton;

  const StandardPage({
    required this.body,
    required this.title,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
