import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_app/services/navigation_service.dart';

import 'application.dart';

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<NavigationService>(NavigationService());
  runApp(Application());
}
