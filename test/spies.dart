import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

class SpyStore extends Store<AppState> {
  SpyStore(
    reducer, {
    AppState initialState,
  }) : super(reducer, initialState: initialState);

  var lastAction;

  @override
  dispatch(action) {
    lastAction = action;
    return super.dispatch(action);
  }
}
