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
        isValidatingQrCode: false,
        hasValidQrCode: null,
        validateCodeFailed: false,
      );

  static AppState appStateWithGoldenSeed() => AppState(
        seed: goldenSeed(),
        isLoadingSeed: false,
        fetchSeedFailed: false,
        isValidatingQrCode: false,
        hasValidQrCode: null,
        validateCodeFailed: false,
      );

  static AppState appStateWithFetchSeedFailed() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: true,
        isValidatingQrCode: false,
        hasValidQrCode: null,
        validateCodeFailed: false,
      );

  static AppState appStateValidatingCode() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: false,
        isValidatingQrCode: true,
        hasValidQrCode: null,
        validateCodeFailed: false,
      );

  static AppState appStateWithValidQrCode() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: false,
        isValidatingQrCode: false,
        hasValidQrCode: true,
        validateCodeFailed: false,
      );

  static AppState appStateWithExpiredQrCode() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: false,
        isValidatingQrCode: false,
        hasValidQrCode: false,
        validateCodeFailed: false,
      );

  static AppState appStateWithValidateQrCodeFailed() => AppState(
        seed: null,
        isLoadingSeed: false,
        fetchSeedFailed: false,
        isValidatingQrCode: false,
        hasValidQrCode: null,
        validateCodeFailed: true,
      );

  // ** Seed **
  static Seed goldenSeed() => Seed(value: 'golden', expiresAt: DateTime(2100));
}
