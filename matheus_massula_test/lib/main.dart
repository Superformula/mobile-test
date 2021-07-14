import 'package:flutter/material.dart';
import 'package:matheus_massula_test/resources/app_theme_data.dart';
import 'package:matheus_massula_test/resources/string_constant.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstant.APP_NAME,
      theme: AppThemeData.lightThemeData,
      home: HomePage(),
    );
  }
}