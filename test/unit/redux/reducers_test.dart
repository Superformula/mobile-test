import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code/model/seed.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:qr_code/redux/reducers.dart';

void main() {
  test(
      "GIVEN AppState doesn't have a seed "
      'WHEN FetchSeedAction is dispatched '
      'THEN isLoadingSeed is true', () {
    final oldState = AppState.init();
    final action = FetchSeedAction();
    final expectedState = AppState(seed: null, isLoadingSeed: true);

    final actualState = appReducer(oldState, action);

    expect(actualState, expectedState);
  });

  test(
      'WHEN SeedLoadedAction is dispatched '
      'THEN AppState has a new seed '
      'AND isLoadingSeed is false', () {
    final seed = Seed(value: '', expiresAt: DateTime(2100));
    final oldState = AppState(seed: null, isLoadingSeed: true);
    final action = SeedLoadedAction(seed);
    final expectedState = AppState(seed: seed, isLoadingSeed: false);

    final actualState = appReducer(oldState, action);

    expect(actualState, expectedState);
  });
}
