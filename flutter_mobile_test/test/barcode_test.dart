import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Barcode reading emits success', () async {
    final barcodeResponse = "SUCCESS";

    setupMockLocator(barcodeResponse);
    final BarcodeBloc bloc = locator();

    await expectLater(bloc.scannerObservable, emitsThrough(barcodeResponse));
  });

  test('Barcode reading emits failure', () async {
    setupMockErrorLocator();
    final BarcodeBloc bloc = locator();

    await expectLater(bloc.scannerObservable, emitsThrough(null));
  });

  test('Barcode reading emits failure and refresh emits failure', () async {
    setupMockErrorLocator();
    final BarcodeBloc bloc = locator();

    await expectLater(bloc.scannerObservable, emitsThrough(null));
    bloc.refresh();
    await expectLater(bloc.scannerObservable, emitsThrough(null));
  });

  test('Barcode reading emits success and refresh emits another success',
      () async {
    final barcodeResponse = "SUCCESS";

    setupMockLocator(barcodeResponse);
    final BarcodeBloc bloc = locator();

    await expectLater(bloc.scannerObservable, emitsThrough(barcodeResponse));

    bloc.refresh();

    await expectLater(bloc.scannerObservable, emitsThrough(barcodeResponse));
  });
}
