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
  final timerDurationSeconds = (action.seed.expiresAt.millisecondsSinceEpoch -
          DateTime.now().millisecondsSinceEpoch) ~/
      1000;
  return state.rebuild((b) => b
    ..loading = false
    ..timerDurationSeconds = timerDurationSeconds
    ..activeSeed = action.seed);
}
