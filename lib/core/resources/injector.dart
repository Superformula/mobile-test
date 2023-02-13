import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:superformula_test/data/data_sources/qr_code_seed_data_source.dart';
import 'package:superformula_test/data/repositories/qr_code_seed_repository.dart';
import 'package:superformula_test/data/resources/api.dart';
import 'package:superformula_test/domain/repositories/qr_code_seed_repository.dart';
import 'package:superformula_test/domain/use_cases/qr_code_get_seed_use_case.dart';
import 'package:superformula_test/domain/use_cases/qr_code_validation_use_case.dart';

typedef FactoryFunc<T> = T Function();
typedef LazySingletonFunc<T> = T Function();

class AppInjector {
  AppInjector._();

  static final AppInjector _instance = AppInjector._();
  static AppInjector instance = _instance;

  final _serviceLocator = GetIt.I;

  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc) =>
      _serviceLocator.registerFactory<T>(factoryFunc);

  void registerLazySingleton<T extends Object>(
    LazySingletonFunc<T> lazySingletonFunc,
  ) =>
      _serviceLocator.registerLazySingleton<T>(lazySingletonFunc);

  T get<T extends Object>() => _serviceLocator<T>();
}

class InitializeInjector {
  InitializeInjector._();

  final _appInjector = AppInjector.instance;

  static final InitializeInjector _instance = InitializeInjector._();
  static InitializeInjector instance = _instance;

  void inject() {
    _appInjector.registerLazySingleton<AppApi<Response>>(() => AppApiImpl());

    _appInjector.registerFactory<QrCodeSeedDataSource>(
      () => QrCodeSeedDataSourceImpl(
        _appInjector.get<AppApi<Response>>(),
      ),
    );
    _appInjector.registerFactory<QrCodeSeedRepository>(
      () => QrCodeSeedRepositoryImpl(
        _appInjector.get<QrCodeSeedDataSource>(),
      ),
    );
    _appInjector.registerFactory<QrCodeGetSeedUseCase>(
      () => QrCodeGetSeedUseCaseImpl(
        _appInjector.get<QrCodeSeedRepository>(),
      ),
    );
    _appInjector.registerFactory<QrCodeValidationUseCase>(
      () => QrCodeValidationUseCaseImpl(
        _appInjector.get<QrCodeSeedRepository>(),
      ),
    );
  }
}
