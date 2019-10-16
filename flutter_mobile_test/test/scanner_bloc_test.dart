import 'package:dio/dio.dart';
import 'package:flutter_mobile_test/barcode/barcode_wrapper.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/models/validation_model.dart';
import 'package:flutter_mobile_test/pages/scanner/scanner_bloc.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

import 'qr_code_bloc_test.dart';

void main() {
  BarcodeWrapper barcodeWrapper;
  QrCodeRepository qrCodeRepository;
  String barcodeResponse;

  setUp(() {
    barcodeWrapper = BarcodeMockWrapper();
    qrCodeRepository = QrCodeMockRepository();

    barcodeResponse = 'SUCCESS';

    locator
      ..registerLazySingleton<BarcodeWrapper>(() => barcodeWrapper)
      ..registerLazySingleton<QrCodeRepository>(() => qrCodeRepository);

    when(barcodeWrapper.scan()).thenAnswer((_) async => barcodeResponse);

    when(qrCodeRepository.validateQrCode('SUCCESS'))
        .thenAnswer((_) => Observable.just(Validation(true)));
  });

  test('Barcode reading emits success', () async {
    final bloc = ScannerBloc(locator<BarcodeWrapper>());

    await expectLater(bloc.scannerObservable, emitsThrough(barcodeResponse));
  });

  test('Barcode reading throws error', () async {
    when(barcodeWrapper.scan()).thenAnswer((_) async => null);

    final bloc = ScannerBloc(locator());

    await expectLater(bloc.scannerObservable, emitsThrough(null));
  });

//
  test('Barcode reading throws error and refresh emits another failure',
      () async {
    when(barcodeWrapper.scan()).thenAnswer((_) async => null);

    final bloc = ScannerBloc(locator());

    await expectLater(bloc.scannerObservable, emitsThrough(null));
    bloc.refresh();
    await expectLater(bloc.scannerObservable, emitsThrough(null));
  });

  test('Barcode reading emits success and refresh emits another success',
      () async {

    final bloc = ScannerBloc(locator());

    await expectLater(bloc.scannerObservable, emitsThrough(barcodeResponse));

    bloc.refresh();

    await expectLater(bloc.scannerObservable, emitsThrough(barcodeResponse));
  });

  test('Barcode validation emits success', () async {
    final BehaviorSubject<bool> validationResultSubject = BehaviorSubject();
    final bloc = ScannerBloc(locator());

    bloc.validateCodeObservable.listen(validationResultSubject.add, onError: validationResultSubject.addError);

    bloc.validate();

    await expectLater(validationResultSubject, emitsThrough(true));
  });

  test('Barcode validation emits failure', () async {
    final BehaviorSubject<bool> validationResultSubject = BehaviorSubject();

    when(qrCodeRepository.validateQrCode(barcodeResponse)).thenAnswer((_) => Observable.error(DioError()));
    final bloc = ScannerBloc(locator());

    bloc.validateCodeObservable.listen(validationResultSubject.add, onError: validationResultSubject.addError);

    bloc.validate();

    await expectLater(validationResultSubject, emitsError(isInstanceOf<DioError>()));
  });

  tearDown(() {
    locator.reset();
  });
}

class BarcodeMockWrapper extends Mock implements BarcodeWrapper {}
