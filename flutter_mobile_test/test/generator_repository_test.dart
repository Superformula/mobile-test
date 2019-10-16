import 'package:dio/dio.dart';
import 'package:flutter_mobile_test/api/qr_code_api.dart';
import 'package:flutter_mobile_test/locator/service_locator.dart';
import 'package:flutter_mobile_test/models/qr_code_models.dart';
import 'package:flutter_mobile_test/repository/qr_code_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  QrCodeMockApi api;
  QrCode qrCode = QrCode('01170115cb7bbafb71c39201b09eaa6d31f24102', 20);

  setUp(() {
    api = QrCodeMockApi();
    locator.registerLazySingleton<QrCodeApi>(() => api);

    when(api.getApiQrCode()).thenAnswer((_) => Future.value(Response(
            data: Map.fromEntries([
          MapEntry('seed', qrCode.seed),
          MapEntry('expireTime', qrCode.expireTime)
        ]))));
  });

  test('Api returns success', () {
    final repository = QrCodeRepository();

    expectLater(
        repository.qrCodeObservable, emitsThrough(isInstanceOf<QrCode>()));
  });

  test('Api returns failure', () {
    when(api.getApiQrCode()).thenThrow(DioError());

    final repository = QrCodeRepository();

    expectLater(repository.qrCodeObservable, emitsError(isInstanceOf<DioError>()));
  });

  test('Api returns object which cannot be parsed then fields are null', () {
    when(api.getApiQrCode()).thenAnswer((_) => Future.value(Response(
        data: Map.fromEntries([
          MapEntry('se', qrCode.seed),
          MapEntry('expire', qrCode.expireTime)
        ]))));

    final repository = QrCodeRepository();

    expectLater(
        repository.qrCodeObservable.map((code) => code.seed), emitsThrough(null));

    expectLater(
        repository.qrCodeObservable.map((code) => code.expireTime), emitsThrough(null));
  });

  tearDown(() {
    locator.reset();
  });
}

class QrCodeMockApi extends Mock implements QrCodeApi {}
