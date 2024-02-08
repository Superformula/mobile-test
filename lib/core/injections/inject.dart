import 'package:get_it/get_it.dart';
import 'package:superformula_leandro/core/injections/dio_inject.dart';
import 'package:superformula_leandro/core/injections/qr_code_scan_inject.dart';

sealed class Inject {
  static void init(GetIt getIt) {
    DioInject.inject();
    QrCodeScanInject.inject();
  }
}
