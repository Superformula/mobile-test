import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/api_middleware.dart';

import '../../fixtures.dart';
import '../../mocks.dart';

void main() {
  StoreMock store;
  ApiClientMock apiClient;
  ApiMiddleware apiMiddleware;

  setUp(() {
    store = StoreMock();
    apiClient = ApiClientMock();
    apiMiddleware = ApiMiddleware(apiClient);
  });

  test(
      'WHEN FetchSeedAction is called '
      'AND api returns a new seed '
      'THEN the seed is loaded', () async {
    final expectedSeed = Fixtures.goldenSeed();
    when(apiClient.fetchSeed()).thenAnswer((_) => Future.value(expectedSeed));

    final action = FetchSeedAction();
    await apiMiddleware.call(store, action, (_) {});

    verify(store.dispatch(SeedLoadedAction(expectedSeed)));
  });

  test(
      'WHEN FetchSeedAction is called '
      'AND api throws an error '
      'THEN FetchSeedFailedAction is dispatched', () async {
    when(apiClient.fetchSeed()).thenAnswer((_) => throw Exception());

    final action = FetchSeedAction();
    await apiMiddleware.call(store, action, (_) {});

    verify(store.dispatch(FetchSeedFailedAction()));
  });

  test(
      'WHEN ValidateQrCodeAction is called '
      'AND api returns that the code is valid '
      'THEN ValidQrCodeAction is dispatched', () async {
    final codeToValidate = 'golden';
    when(apiClient.validateQrCode(codeToValidate)).thenAnswer((_) => Future.value(true));

    final action = ValidateQrCodeAction(codeToValidate);
    await apiMiddleware.call(store, action, (_) {});

    verify(store.dispatch(ValidQrCodeAction()));
  });

  test(
      'WHEN ValidateQrCodeAction is called '
      'AND api returns that the code has expired '
      'THEN ExpiredQrCodeAction is dispatched', () async {
    final codeToValidate = 'golden';
    when(apiClient.validateQrCode(codeToValidate)).thenAnswer((_) => Future.value(false));

    final action = ValidateQrCodeAction(codeToValidate);
    await apiMiddleware.call(store, action, (_) {});

    verify(store.dispatch(ExpiredQrCodeAction()));
  });

  test(
      'WHEN ValidateQrCodeAction is called '
      'AND api throws an error '
      'THEN ValidateQrCodeFailedAction is dispatched', () async {
    final codeToValidate = 'golden';
    when(apiClient.validateQrCode(codeToValidate)).thenAnswer((_) => throw Exception());

    final action = ValidateQrCodeAction(codeToValidate);
    await apiMiddleware.call(store, action, (_) {});

    verify(store.dispatch(ValidateQrCodeFailedAction()));
  });
}
