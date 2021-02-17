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
      _fetchSeed(store);
    }

    if (action is ValidateQrCodeAction) {
      _validateQrCode(store, action);
    }

    next(action);
  }

  Future _fetchSeed(Store<AppState> store) async {
    try {
      final seed = await _apiClient.fetchSeed();
      store.dispatch(SeedLoadedAction(seed));
    } catch (_) {
      store.dispatch(FetchSeedFailedAction());
    }
  }

  Future _validateQrCode(Store<AppState> store, ValidateQrCodeAction action) async {
    try {
      final isValid = await _apiClient.validateQrCode(action.codeToValidate);
      if (isValid) {
        store.dispatch(ValidQrCodeAction());
      } else {
        store.dispatch(ExpiredQrCodeAction());
      }
    } catch (_) {
      store.dispatch(ValidateQrCodeFailedAction());
    }
  }
}
