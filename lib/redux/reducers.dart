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

AppState _onFetchSeed(AppState state, FetchSeedAction action) => state.copyWith(
      seedState: SeedState.inProgress(),
    );

AppState _onSeedLoaded(AppState state, SeedLoadedAction action) => state.copyWith(
      seedState: SeedState.loaded(action.seed),
    );

AppState _onFetchSeedFailed(AppState state, FetchSeedFailedAction action) => state.copyWith(
      seedState: SeedState.error(),
    );

AppState _onValidateQrCode(AppState state, ValidateQrCodeAction action) => state.copyWith(
      validationState: ValidationState.inProgress(),
    );

AppState _onValidQrCode(AppState state, ValidQrCodeAction action) => state.copyWith(
      validationState: ValidationState.validCode(),
    );

AppState _onExpiredQrCode(AppState state, ExpiredQrCodeAction action) => state.copyWith(
      validationState: ValidationState.expiredCode(),
    );

AppState _onValidateQrCodeFailed(AppState state, ValidateQrCodeFailedAction action) => state.copyWith(
      validationState: ValidationState.error(),
    );
