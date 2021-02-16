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
}
