import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home.dart';
import 'resources/app_theme_data.dart';
import 'resources/string_constant.dart';
import 'services/http/qr_code_web_client.dart';

void main() {
  runApp(MyApp(qrCodeWebClient: QrCodeWebClient(interceptorClient)));
}

class MyApp extends StatelessWidget {
  final QrCodeWebClient qrCodeWebClient;

  const MyApp({Key? key, required this.qrCodeWebClient}) : super(key: key);
  
  @override
  Widget build(BuildContext context) => RepositoryProvider.value(
    value: qrCodeWebClient,
    child: MaterialApp(
      title: StringConstant.APP_NAME,
      theme: AppThemeData.lightThemeData,
      home: Home(),
    ),
  );
}