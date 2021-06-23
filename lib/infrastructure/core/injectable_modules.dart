import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectableModules {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  
  @lazySingleton
  Dio get dio => Dio();

}
