import 'package:qr_code/redux/app_state.dart';
import 'package:qr_code/redux/reducers.dart';
import 'package:redux/redux.dart';

Store<AppState> createReduxStore() => Store<AppState>(
      appReducer,
      initialState: AppState.init(),
    );
