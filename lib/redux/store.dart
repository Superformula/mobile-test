import 'package:qr_code/api/api_client.dart';
import 'package:qr_code/redux/api_middleware.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:qr_code/redux/auto_refresh_middleware.dart';
import 'package:qr_code/redux/reducers.dart';
import 'package:redux/redux.dart';

Store<AppState> createReduxStore() => Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: [
        ApiMiddleware(ApiClient()),
        AutoRefreshMiddleware(),
      ],
    );
