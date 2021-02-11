import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:qr_app/configure_container.dart';
import 'application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  configureContainer();
  runApp(Application());
}
