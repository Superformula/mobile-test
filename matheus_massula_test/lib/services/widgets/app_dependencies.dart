import 'package:flutter/material.dart';
import 'package:matheus_massula_test/services/http/qr_code_web_client.dart';

class AppDependencies extends InheritedWidget {
  final QRCodeWebClient qrCodeWebClient;

  AppDependencies({
    Key? key,
    required Widget child,
    required this.qrCodeWebClient
  }) : super(key: key, child: child);
  
  
  static AppDependencies? of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType<AppDependencies>();

  @override
  bool updateShouldNotify(covariant AppDependencies oldWidget) {
    return qrCodeWebClient != oldWidget.qrCodeWebClient;
  }
  
}