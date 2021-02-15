import 'package:qr_code/api/api_client.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {
  ApiMiddleware(this._apiClient);

  final ApiClient _apiClient;

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is FetchSeedAction) {
      return _fetchSeed(store);
    }

    next(action);
  }

  Future _fetchSeed(Store<AppState> store) async {
    final seed = await _apiClient.fetchSeed();
    store.dispatch(SeedLoadedAction(seed));
  }
}
