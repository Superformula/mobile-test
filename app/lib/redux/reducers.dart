import 'package:redux/redux.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, FetchQRSeed>(fetchQRSeedReducer),
  TypedReducer<AppState, FetchQRSeedSuccess>(fetchQRSeedSuccessReducer),
]);

AppState fetchQRSeedReducer(AppState state, FetchQRSeed action) {
  return state.rebuild((b) => b..loading = true);
}

AppState fetchQRSeedSuccessReducer(AppState state, FetchQRSeedSuccess action) {
  return state.rebuild((b) => b
    ..loading = false
    ..activeSeed = action.seed);
}

AppState cancelTimerReducer(AppState state, CancelTimer action) {
  return state.rebuild((b) => b..timer = null);
}

AppState updateTimer(AppState )
