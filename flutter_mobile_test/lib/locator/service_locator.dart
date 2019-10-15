import 'package:dio/dio.dart';
import 'package:flutter_mobile_test/api/qr_code_api.dart';
import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:flutter_mobile_test/pages/generator/generator_bloc.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator
    ..registerLazySingleton(() => BarcodeWrapper())
    ..registerLazySingleton(() => QrCodeApi())
    ..registerLazySingleton(() => QrCodeRepository(locator()));
  //blocs
  locator
    ..registerFactory(() => BarcodeBloc(locator()))
    ..registerFactory(() => GeneratorBloc(locator()));
}

void setupMockLocator(String barcodeResponse) {
  final BarcodeWrapper barcodeMockWrapper = BarcodeMockWrapper();
  when(barcodeMockWrapper.scan()).thenAnswer((_) async => barcodeResponse);

  final QrCodeApi qrCodeApi = QrCodeMockApi();
  when(qrCodeApi.getMockApiQrCode).thenAnswer((_) async => Response(
      data: Map.fromEntries(
          [MapEntry('seed', '9b0a34057c9d302628e1d7ef50e37b08')])));

  locator
    ..registerLazySingleton(() => barcodeMockWrapper)
    ..registerLazySingleton(() => QrCodeRepository(qrCodeApi));

  //blocs
  locator
    ..registerFactory(() => BarcodeBloc(locator()))
    ..registerFactory(() => GeneratorBloc(locator()));
}

void setupMockErrorLocator() {
  final BarcodeWrapper barcodeMockWrapper = BarcodeMockWrapper();
  when(barcodeMockWrapper.scan()).thenAnswer((_) async => null);

  final QrCodeApi qrCodeApi = QrCodeMockApi();
  when(qrCodeApi.getMockApiQrCode)
      .thenAnswer((_) async => Response(statusCode: 500));

  locator
    ..registerLazySingleton(() => barcodeMockWrapper)
    ..registerLazySingleton(() => QrCodeRepository(qrCodeApi));

  //blocs
  locator
    ..registerFactory(() => BarcodeBloc(locator()))
    ..registerFactory(() => GeneratorBloc(locator()));
}
