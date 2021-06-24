// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'application/qr_page/qr_page_cubit.dart' as _i7;
import 'application/scan_page/scan_page_cubit.dart' as _i8;
import 'domain/i_seed_generator_repository.dart' as _i5;
import 'infrastructure/core/injectable_modules.dart' as _i9;
import 'infrastructure/seed_generator_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModules = _$InjectableModules();
  gh.lazySingleton<_i3.Dio>(() => injectableModules.dio);
  await gh.factoryAsync<_i4.SharedPreferences>(() => injectableModules.prefs,
      preResolve: true);
  gh.lazySingleton<_i5.ISeedGeneratorRepository>(() =>
      _i6.SeedGeneratorRepository(
          get<_i4.SharedPreferences>(), get<_i3.Dio>()));
  gh.factory<_i7.QrPageCubit>(
      () => _i7.QrPageCubit(get<_i5.ISeedGeneratorRepository>()));
  gh.factory<_i8.ScanPageCubit>(
      () => _i8.ScanPageCubit(get<_i5.ISeedGeneratorRepository>()));
  return get;
}

class _$InjectableModules extends _i9.InjectableModules {}
