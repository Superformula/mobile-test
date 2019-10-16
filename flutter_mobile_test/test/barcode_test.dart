import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  BarcodeWrapper barcodeWrapper;
  String barcodeResponse;
  BarcodeBloc bloc;

  setUp(() {
    barcodeWrapper = BarcodeMockWrapper();
    barcodeResponse = "SUCCESS";
    locator.registerLazySingleton<BarcodeWrapper>(() => barcodeWrapper);

    when(barcodeWrapper.scan()).thenAnswer((_) async => barcodeResponse);

    bloc = BarcodeBloc(locator());
  });

  test('Barcode reading emits success', () async {
    await expectLater(bloc.scannerObservable, emitsThrough(barcodeResponse));
  });

  test('Barcode reading throws error', () async {
    when(barcodeWrapper.scan()).thenAnswer((_) async => null);

    await expectLater(bloc.scannerObservable, emitsThrough(null));
  });

//
  test('Barcode reading throws error and refresh emits another failure',
      () async {

    when(barcodeWrapper.scan()).thenAnswer((_) async => null);

    await expectLater(bloc.scannerObservable, emitsThrough(null));
    bloc.refresh();
    await expectLater(bloc.scannerObservable, emitsThrough(null));
  });

  test('Barcode reading emits success and refresh emits another success',
      () async {

    await expectLater(bloc.scannerObservable, emitsThrough(barcodeResponse));

    bloc.refresh();

    await expectLater(bloc.scannerObservable, emitsThrough(barcodeResponse));
  });

  tearDown(() {
    locator.reset();
  });
}

class BarcodeMockWrapper extends Mock implements BarcodeWrapper {}
