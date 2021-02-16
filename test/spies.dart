import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

class SpyStore extends Store<AppState> {
  SpyStore(
    reducer, {
    AppState initialState,
  }) : super(reducer, initialState: initialState);

  var receivedActions = [];

  @override
  dispatch(action) {
    receivedActions.add(action);
    return super.dispatch(action);
  }
}
