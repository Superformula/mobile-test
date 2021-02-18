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
        seed: null,
        isLoadingSeed: true,
        fetchSeedFailed: false,
        validationState: ValidationState.idle(),
      );

  static AppState appStateWithGoldenSeed() => appStateWithSeed(goldenSeed());

  static AppState appStateWithSeed(Seed seed) => AppState(
        seed: seed,
        isLoadingSeed: false,
        fetchSeedFailed: false,
        validationState: ValidationState.idle(),
      );

  static AppState appStateWithFetchSeedFailed() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: true,
        validationState: ValidationState.idle(),
      );

  static AppState appStateValidatingCode() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: false,
        validationState: ValidationState.inProgress(),
      );

  static AppState appStateWithValidQrCode() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: false,
        validationState: ValidationState.validCode(),
      );

  static AppState appStateWithExpiredQrCode() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: false,
        validationState: ValidationState.expiredCode(),
      );

  static AppState appStateWithValidateQrCodeFailed() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: false,
        validationState: ValidationState.error(),
      );

  // ** Seed **
  static Seed goldenSeed() => Seed(value: 'golden', expiresAt: DateTime(2100));
}
