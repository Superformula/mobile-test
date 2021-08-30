import 'package:flutter/material.dart';
import 'package:superformula_test/core/app/app_binding.dart';

import 'core/app/app_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///Makes gradient colors smoother
  Paint.enableDithering = true;
  await AppBinding.initServices();

  runApp(MyApp());
}
