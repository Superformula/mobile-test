import 'package:redux/redux.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, FetchQRCode>(fetchQRCodeReducer),
  TypedReducer<AppState, FetchQRCodeSuccess>(fetchQRCodeSuccessReducer),
]);

AppState fetchQRCodeReducer(AppState state, FetchQRCode action) {
  return state.rebuild((b) => b..loading = true);
}

AppState fetchQRCodeSuccessReducer(AppState state, FetchQRCodeSuccess action) {
  final timerDurationSeconds = (action.seed.expiresAt.millisecondsSinceEpoch -
          DateTime.now().millisecondsSinceEpoch) ~/
      1000;
  return state.rebuild((b) => b
    ..loading = false
    ..timerDurationSeconds = timerDurationSeconds
    ..activeSeed = action.seed);
}
