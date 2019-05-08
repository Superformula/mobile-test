import 'dart:async';

import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:supercode/redux/actions.dart';
import 'package:supercode/redux/app_state.dart';
import 'package:supercode/redux/helpers.dart';
import 'package:supercode/services/seed_service.dart';

List<Middleware<AppState>> createMiddleware({
  @required SeedService service,
}) {
  return [
    FetchQRSeedMiddleware(seedService: service),
  ];
}

class FetchQRSeedMiddleware
    extends TypedMiddlewareClass<AppState, FetchQRSeed> {
  final SeedService seedService;

  FetchQRSeedMiddleware({@required this.seedService});

  @override
  FutureOr<void> handler(
    Store<AppState> store,
    FetchQRSeed action,
    NextDispatcher next,
  ) async {
    next(action);

    try {
      final seed = await seedService.fetchSeed();
      store.dispatch(FetchQRSeedSuccess(seed));
    } catch (e) {
      print(e);
    }
  }
}
