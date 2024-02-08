import 'package:dio/dio.dart';
import 'package:superformula_leandro/core/injections/instances/get_it_instance.dart';

sealed class DioInject {
  static Future<void> inject() async {
    getIt.registerFactory<Dio>(
      () => Dio(
        BaseOptions(
          connectTimeout: const Duration(
            seconds: 8,
          ),
        ),
      ),
    );
  }
}
