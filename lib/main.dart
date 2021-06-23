import 'package:flutter/material.dart';
import 'package:qr_generator/injection.dart';
import 'package:qr_generator/presentation/core/app_widget.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp(AppWidget());
}
