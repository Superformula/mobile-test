import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

class Fixtures {
  Fixtures._();

  static Store<AppState> buildStore() => Store(
        (state, _) => state,
        initialState: AppState.init(),
      );
}
