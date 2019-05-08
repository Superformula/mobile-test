import 'package:flutter/material.dart';

class SupercodeAppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/superformula.png'),
        Text('uperCode')
      ],
    );
  }
}
