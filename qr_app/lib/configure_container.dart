import 'package:get_it/get_it.dart';

import 'repositories/seed_repository.dart';
import 'services/services.dart';

final getIt = GetIt.instance;
void configureContainer() {
  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerLazySingleton<LoggingService>(() => LoggingService());

  getIt.registerLazySingleton<ConfigurationService>(
      () => ConfigurationService());
  getIt.registerLazySingleton<SeedRepository>(() => SeedRepository());
  getIt.registerLazySingleton<CacheService>(() => CacheService());
}
