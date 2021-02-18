import 'package:qr_code/model/seed.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

import 'spies.dart';

class Fixtures {
  Fixtures._();

  // ** Store **
  static Store<AppState> store({AppState initialState}) => Store(
        (state, _) => state,
        initialState: initialState ?? AppState.init(),
      );

  static SpyStore spyStore({AppState initialState}) => SpyStore(
        (AppState state, _) => state,
        initialState: initialState ?? AppState.init(),
      );

  // ** AppState **
  static AppState appStateLoading() => AppState(
        seedState: SeedState.inProgress(),
        validationState: ValidationState.idle(),
      );

  static AppState appStateWithGoldenSeed() => appStateWithSeed(goldenSeed());

  static AppState appStateWithSeed(Seed seed) => AppState(
        seedState: SeedState.loaded(seed),
        validationState: ValidationState.idle(),
      );

  static AppState appStateWithFetchSeedFailed() => AppState(
        seedState: SeedState.error(),
        validationState: ValidationState.idle(),
      );

  static AppState appStateValidatingCode() => AppState(
        seedState: SeedState.idle(),
        validationState: ValidationState.inProgress(),
      );

  static AppState appStateWithValidQrCode() => AppState(
        seedState: SeedState.idle(),
        validationState: ValidationState.validCode(),
      );

  static AppState appStateWithExpiredQrCode() => AppState(
        seedState: SeedState.idle(),
        validationState: ValidationState.expiredCode(),
      );

  static AppState appStateWithValidateQrCodeFailed() => AppState(
        seedState: SeedState.idle(),
        validationState: ValidationState.error(),
      );

  // ** Seed **
  static Seed goldenSeed() => Seed(value: 'golden', expiresAt: DateTime(2100));
}
