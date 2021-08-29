// Package imports:
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:superformula_test/domain/qr_code/repository/qr_code_repo.dart';

class ServiceLocator {
  static final locator = GetIt.instance;

  static Future<void> register() async {
    locator.registerLazySingleton<RestClient>(() => RestClient(Dio()));
  }
}
