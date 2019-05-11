import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, FetchQRCode>(fetchQRCodeReducer),
  TypedReducer<AppState, FetchQRCodeSuccess>(fetchQRCodeSuccessReducer),
  TypedReducer<AppState, ValidateCode>(validateCodeReducer),
  TypedReducer<AppState, ValidateCodeSuccess>(validateCodeSuccessReducer)
]);

AppState fetchQRCodeReducer(AppState state, FetchQRCode action) {
  return state.rebuild((b) => b..loading = true);
}

AppState fetchQRCodeSuccessReducer(
  AppState state,
  FetchQRCodeSuccess action, {
  @visibleForTesting DateTime mockNow,
}) {
  final now = mockNow ?? DateTime.now();
  final seed = action.seed;
  final timerDurationSeconds = seed.expiresAt.difference(now).inSeconds;
  return state.rebuild((b) => b
    ..loading = false
    ..timerDurationSeconds = timerDurationSeconds < 0 ? 0 : timerDurationSeconds
    ..activeSeed = action.seed);
}

AppState validateCodeReducer(AppState state, ValidateCode action) {
  return state.rebuild((b) => b..validating = true);
}

AppState validateCodeSuccessReducer(
  AppState state,
  ValidateCodeSuccess action,
) {
  return state.rebuild((b) => b
    ..validating = false
    ..codeIsValid = action.codeIsValid);
}

AppState resetValidateReducer(AppState state, ResetValidate action) {
  return state.rebuild((b) => b
    ..validating = false
    ..codeIsValid = null);
}
