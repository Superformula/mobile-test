import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superformula_mobile_test/infrastructure/platform/data_connection_checker.dart';

@module
abstract class PlatformInjectableModule {
  @lazySingleton
  DataConnectionChecker get connectionChecker => DataConnectionChecker();

  @lazySingleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  Client get httpClient => Client();
}
