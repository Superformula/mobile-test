import 'package:dio/dio.dart';
import 'package:flutter_mobile_test/api/qr_code_api.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/models/qr_code_model.dart';
import 'package:flutter_mobile_test/models/validation_model.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  QrCodeMockApi api;
  QrCode qrCode = QrCode(
      '01170115cb7bbafb71c39201b09eaa6d31f24102', '2019-10-16T10:47:15Z');

  setUp(() {
    api = QrCodeMockApi();
    locator.registerLazySingleton<QrCodeApi>(() => api);

    when(api.getApiQrCode()).thenAnswer((_) => Future.value(Response(
            data: Map.fromEntries([
          MapEntry('seed', qrCode.seed),
          MapEntry('expireTime', qrCode.expiresAt)
        ]))));

    when(api.validateQrCode('SUCCESS')).thenAnswer((_) => Future.value(
        Response(data: Map.fromEntries([MapEntry('is_valid', true)]))));
  });

  test('Seed request returns success', () {
    final repository = QrCodeRepository();

    expectLater(
        repository.qrCodeObservable, emitsThrough(isInstanceOf<QrCode>()));
  });

  test('Seed request returns failure', () {
    when(api.getApiQrCode()).thenThrow(DioError());

    final repository = QrCodeRepository();

    expectLater(
        repository.qrCodeObservable, emitsError(isInstanceOf<DioError>()));
  });

  test(
      'When Seed request returns object which cannot be parsed then fields are null',
      () {
    when(api.getApiQrCode()).thenAnswer((_) => Future.value(Response(
            data: Map.fromEntries([
          MapEntry('se', qrCode.seed),
          MapEntry('expire', qrCode.expiresAt)
        ]))));

    final repository = QrCodeRepository();

    expectLater(repository.qrCodeObservable.map((code) => code.seed),
        emitsThrough(null));

    expectLater(repository.qrCodeObservable.map((code) => code.expiresAt),
        emitsThrough(null));
  });

  tearDown(() {
    locator.reset();
  });

  test('Validation request returns successful validation', () {
    final repository = QrCodeRepository();

    expectLater(
        repository
            .validateQrCode('SUCCESS')
            .map((validation) => validation.isValid),
        emitsThrough(true));
  });

  test('Validation request returns unsuccessful validation', () {
    when(api.validateQrCode('NOT_VALID')).thenAnswer((_) => Future.value(
        Response(data: Map.fromEntries([MapEntry('is_valid', false)]))));

    final repository = QrCodeRepository();

    expectLater(
        repository
            .validateQrCode('NOT_VALID')
            .map((validation) => validation.isValid),
        emitsThrough(false));
  });

  test('Validation request fails', () {
    when(api.validateQrCode('SUCCESS')).thenThrow(DioError());

    final repository = QrCodeRepository();

    expectLater(repository.validateQrCode('NOT_VALID'),
        emitsError(isInstanceOf<Error>()));
  });
}

class QrCodeMockApi extends Mock implements QrCodeApi {}
