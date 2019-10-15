import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('Barcode reading emits success', () async {
    final barcodeWrapper = BarcodeMockWrapper();
    when(barcodeWrapper.scan()).thenAnswer((_) async => "SUCCESS");

    final bloc = BarcodeBloc(barcodeWrapper);

    await expectLater(bloc.scannerObservable, emitsThrough("SUCCESS"));
  });

  test('Barcode reading emits failure', () async {
    final barcodeWrapper = BarcodeMockWrapper();
    when(barcodeWrapper.scan()).thenAnswer((_) async => null);

    final bloc = BarcodeBloc(barcodeWrapper);

    await expectLater(bloc.scannerObservable, emitsThrough(null));
  });

  test('Barcode reading emits failure and refresh emits failure', () async {
    final barcodeWrapper = BarcodeMockWrapper();
    when(barcodeWrapper.scan()).thenAnswer((_) async => null);

    final bloc = BarcodeBloc(barcodeWrapper);

    await expectLater(bloc.scannerObservable, emitsThrough(null));
    bloc.refresh();
    await expectLater(bloc.scannerObservable, emitsThrough(null));
  });

  test('Barcode reading emits success and refresh emits another success', () async {
    final barcodeWrapper = BarcodeMockWrapper();
    var response = "SUCCESS";
    when(barcodeWrapper.scan()).thenAnswer((_) async => response);

    final bloc = BarcodeBloc(barcodeWrapper);

    await expectLater(bloc.scannerObservable, emitsThrough(response));

    response = "SUCCESS2";
    bloc.refresh();

    await expectLater(bloc.scannerObservable, emitsThrough(response));
  });
}

class BarcodeMockWrapper extends Mock implements BarcodeWrapper {}
