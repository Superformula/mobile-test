import 'package:flutter_mobile_test/api/qr_code_api.dart';
import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:flutter_mobile_test/pages/generator/qr_code_bloc.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
    ..registerLazySingleton(() => BarcodeWrapper())
    ..registerLazySingleton(() => QrCodeApi())
    ..registerLazySingleton(() => QrCodeRepository());
  //blocs
  locator
    ..registerFactory(() => ScannerBloc(locator()))
    ..registerFactory(() => QrCodeBloc());
}