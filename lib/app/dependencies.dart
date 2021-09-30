import 'package:get_it/get_it.dart';
import 'package:qr_api/qr_api.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt
    ..registerSingleton<QrApi>(QrApi())
    ..registerFactory<SeedRepository>(
        () => SeedRepositoryImpl(getIt.get<QrApi>()));
}
