import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matheus_massula_test/resources/app_theme_data.dart';
import 'package:matheus_massula_test/resources/string_constant.dart';
import 'package:matheus_massula_test/services/http/qr_code_web_client.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp(qrCodeWebClient: QRCodeWebClient()));
}

class MyApp extends StatelessWidget {
  final QRCodeWebClient qrCodeWebClient;

  const MyApp({
    Key? key,
    required this.qrCodeWebClient
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RepositoryProvider.value(
    value: qrCodeWebClient,
    child: MaterialApp(
      title: StringConstant.APP_NAME,
      theme: AppThemeData.lightThemeData,
      home: HomePage(),
    ),
  );
}