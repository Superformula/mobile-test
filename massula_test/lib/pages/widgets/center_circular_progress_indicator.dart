import 'package:flutter/material.dart';

class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(child: CircularProgressIndicator());
}