import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code/model/seed.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/auto_refresh_middleware.dart';

import '../../mocks.dart';

void main() {
  StoreMock store;
  AutoRefreshMiddleware autoRefreshMiddleware;
  Seed seed;

  setUp(() {
    store = StoreMock();
    autoRefreshMiddleware = AutoRefreshMiddleware();
    seed = Seed(value: 'golden', expiresAt: DateTime.now().add(Duration(seconds: 10)));
  });

  testWidgets(
      'WHEN a seed is loaded '
      "AND it hasn't expired yet"
      'THEN no action is dispatched', (WidgetTester tester) async {
    autoRefreshMiddleware.call(store, SeedLoadedAction(seed), (_) {});

    await tester.pump(Duration(seconds: 9));

    verifyNever(store.dispatch(any));

    // We need to pump some more to make sure the timer is finished
    await tester.pump(Duration(seconds: 1));
  });

  testWidgets(
      'GIVEN a seed is loaded '
      'WHEN it has expired '
      'THEN a FetchSeedAction is dispatched', (WidgetTester tester) async {
    autoRefreshMiddleware.call(store, SeedLoadedAction(seed), (_) {});

    await tester.pump(Duration(seconds: 11));

    verify(store.dispatch(FetchSeedAction()));
  });

  testWidgets(
      'GIVEN auto refresh is turned off '
      'WHEN a seed is loaded'
      'AND it has expired '
      'THEN no action dispatched', (WidgetTester tester) async {
    autoRefreshMiddleware.call(store, TurnOffAutoRefreshAction(), (_) => {});

    autoRefreshMiddleware.call(store, SeedLoadedAction(seed), (_) {});

    await tester.pump(Duration(seconds: 11));

    verifyNever(store.dispatch(any));
  });

  testWidgets(
      'GIVEN auto refresh is turned off '
      'WHEN TurnOnAutoRefreshAction is dispatched '
      'THEN auto refresh is re-enabled', (WidgetTester tester) async {
    autoRefreshMiddleware.call(store, TurnOffAutoRefreshAction(), (_) => {});

    autoRefreshMiddleware.call(store, TurnOnAutoRefreshAction(), (_) => {});
    autoRefreshMiddleware.call(store, SeedLoadedAction(seed), (_) {});

    await tester.pump(Duration(seconds: 11));

    verify(store.dispatch(FetchSeedAction()));
  });
}
