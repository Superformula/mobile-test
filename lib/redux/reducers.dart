import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, FetchSeedAction>(_onFetchSeed),
  TypedReducer<AppState, SeedLoadedAction>(_onSeedLoaded),
  TypedReducer<AppState, FetchSeedFailedAction>(_onFetchSeedFailed),
  TypedReducer<AppState, ValidateQrCodeAction>(_onValidateQrCode),
  TypedReducer<AppState, ValidQrCodeAction>(_onValidQrCode),
  TypedReducer<AppState, ExpiredQrCodeAction>(_onExpiredQrCode),
  TypedReducer<AppState, ValidateQrCodeFailedAction>(_onValidateQrCodeFailed),
]);

AppState _onFetchSeed(AppState state, FetchSeedAction action) => state.copyWith(isLoadingSeed: true);

AppState _onSeedLoaded(AppState state, SeedLoadedAction action) => state.copyWith(
      seed: action.seed,
      isLoadingSeed: false,
    );

AppState _onFetchSeedFailed(AppState state, FetchSeedFailedAction action) => state.copyWith(
      fetchSeedFailed: true,
      isLoadingSeed: false,
    );

AppState _onValidateQrCode(AppState state, ValidateQrCodeAction action) => state.copyWith(isValidatingQrCode: true);

AppState _onValidQrCode(AppState state, ValidQrCodeAction action) => state.copyWith(
      isValidatingQrCode: false,
      hasValidQrCode: true,
    );

AppState _onExpiredQrCode(AppState state, ExpiredQrCodeAction action) => state.copyWith(
      isValidatingQrCode: false,
      hasValidQrCode: false,
    );

AppState _onValidateQrCodeFailed(AppState state, ValidateQrCodeFailedAction action) => state.copyWith(
      isValidatingQrCode: false,
      hasValidQrCode: null,
      validateCodeFailed: true,
    );
