import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

/// This middleware detects when a QR code expires and triggers
/// a FetchSeedAction
class ExpireMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is SeedLoadedAction) {
      _triggerFetchingSeed(store, action);
    }
    next(action);
  }

  Future _triggerFetchingSeed(Store<AppState> store, SeedLoadedAction action) async {
    final difference = action.seed.expiresAt.difference(DateTime.now());
    await Future.delayed(difference);
    store.dispatch(FetchSeedAction());
  }
}
