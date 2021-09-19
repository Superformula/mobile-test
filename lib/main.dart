import 'package:flutter/material.dart';
import 'package:superformula_mobile_test/presentation/core/app_widget.dart';

import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies('dev');
  runApp(const SuperFormulaChallengeApp());
}
