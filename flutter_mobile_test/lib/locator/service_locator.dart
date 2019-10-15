import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => BarcodeWrapper());
  //blocs
  locator.registerFactory(() => BarcodeBloc(locator()));
}

void setupMockLocator(String barcodeResponse) {
  final BarcodeWrapper barcodeMockWrapper = BarcodeMockWrapper();
  when(barcodeMockWrapper.scan()).thenAnswer((_) async => barcodeResponse);

  locator.registerLazySingleton(() => barcodeMockWrapper);
  //blocs
  locator.registerFactory(() => BarcodeBloc(locator()));

}

void setupMockErrorLocator() {

  final BarcodeWrapper barcodeMockWrapper = BarcodeMockWrapper();
  when(barcodeMockWrapper.scan()).thenAnswer((_) async => null);

  locator.registerLazySingleton(() => barcodeMockWrapper);
  //blocs
  locator.registerFactory(() => BarcodeBloc(locator()));

}