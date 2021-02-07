import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'repositories/seed_repository.dart';
import 'services/services.dart';
import 'application.dart';

final getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerLazySingleton<ConfigurationService>(
      () => ConfigurationService());
  getIt.registerLazySingleton<SeedRepository>(() => SeedRepository());
  runApp(Application());
}
