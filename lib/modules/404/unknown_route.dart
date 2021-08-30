import 'package:flutter/material.dart';

///Widget shown when a user tries to access an unknown route
class UnknownRoute extends StatelessWidget {
  const UnknownRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('404: UNKNOWN PAGE'),
      ),
    );
  }
}
