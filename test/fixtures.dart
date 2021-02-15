import 'package:qr_code/model/seed.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

class Fixtures {
  Fixtures._();

  // ** Store **
  static Store<AppState> store({AppState initialState}) => Store(
        (state, _) => state,
        initialState: initialState ?? AppState.init(),
      );

  // ** AppState **
  static AppState appStateLoading() => AppState(seed: null, isLoadingSeed: true);

  static AppState appStateWithGoldenSeed() => AppState(seed: goldenSeed(), isLoadingSeed: false);

  // ** Seed **
  static Seed goldenSeed() => Seed(value: 'golden', expiresAt: DateTime(2100));
}
