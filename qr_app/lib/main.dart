import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get_it/get_it.dart';

import 'repositories/seed_repository.dart';
import 'services/services.dart';
import 'application.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerLazySingleton<ConfigurationService>(
      () => ConfigurationService());
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerLazySingleton<SeedRepository>(() => SeedRepository());
  runApp(Application());
}
