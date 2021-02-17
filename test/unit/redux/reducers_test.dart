import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:qr_code/redux/reducers.dart';

import '../../fixtures.dart';

void main() {
  test(
      "GIVEN AppState doesn't have a seed "
      'WHEN FetchSeedAction is dispatched '
      'THEN isLoadingSeed is true', () {
    final oldState = AppState.init();
    final action = FetchSeedAction();
    final expectedState = Fixtures.appStateLoading();

    final actualState = appReducer(oldState, action);

    expect(actualState, expectedState);
  });

  test(
      'WHEN SeedLoadedAction is dispatched '
      'THEN AppState has a new seed '
      'AND isLoadingSeed is false', () {
    final oldState = Fixtures.appStateLoading();
    final action = SeedLoadedAction(Fixtures.goldenSeed());
    final expectedState = Fixtures.appStateWithGoldenSeed();

    final actualState = appReducer(oldState, action);

    expect(actualState, expectedState);
  });

  test(
      'WHEN FetchSeedFailedAction is dispatched '
      'THEN app is in error state', () {
    final oldState = Fixtures.appStateLoading();
    final action = FetchSeedFailedAction();
    final expectedState = Fixtures.appStateWithFetchSeedFailed();

    final actualState = appReducer(oldState, action);

    expect(actualState, expectedState);
  });

  test(
      'WHEN ValidateQrCodeAction is dispatched '
      'THEN app is in loading state', () {
    final oldState = AppState.init();
    final action = ValidateQrCodeAction();
    final expectedState = Fixtures.appStateValidatingCode();

    final actualState = appReducer(oldState, action);

    expect(actualState, expectedState);
  });

  test(
      'WHEN ValidQrCodeAction is dispatched '
      'THEN app has a valid qr code', () {
    final oldState = Fixtures.appStateValidatingCode();
    final action = ValidQrCodeAction();
    final expectedState = Fixtures.appStateWithValidQrCode();

    final actualState = appReducer(oldState, action);

    expect(actualState, expectedState);
  });

  test(
      'WHEN ExpiredQrCodeAction is dispatched '
      'THEN app has an expired qr code', () {
    final oldState = Fixtures.appStateValidatingCode();
    final action = ExpiredQrCodeAction();
    final expectedState = Fixtures.appStateWithExpiredQrCode();

    final actualState = appReducer(oldState, action);

    expect(actualState, expectedState);
  });

  test(
      'WHEN ValidateQrCodeFailedAction is dispatched '
      'THEN app is in error state', () {
    final oldState = Fixtures.appStateValidatingCode();
    final action = ValidateQrCodeFailedAction();
    final expectedState = Fixtures.appStateWithValidateQrCodeFailed();

    final actualState = appReducer(oldState, action);

    expect(actualState, expectedState);
  });
}
