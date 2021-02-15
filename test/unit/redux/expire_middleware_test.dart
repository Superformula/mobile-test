import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code/model/seed.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/expire_middleware.dart';

import '../../mocks.dart';

void main() {
  StoreMock store;
  ExpireMiddleware expireMiddleware;
  Seed seed;

  setUp(() {
    store = StoreMock();
    expireMiddleware = ExpireMiddleware();
    seed = Seed(value: 'golden', expiresAt: DateTime.now().add(Duration(seconds: 10)));
  });

  testWidgets(
      'WHEN a seed is loaded '
      "AND it hasn't expired yet"
      'THEN no action is dispatched', (WidgetTester tester) async {
    expireMiddleware.call(store, SeedLoadedAction(seed), (_) {});

    await tester.pump(Duration(seconds: 9));

    verifyNever(store.dispatch(any));

    // We need to pump some more to make sure the timer is finished
    await tester.pump(Duration(seconds: 1));
  });

  testWidgets(
      'GIVEN a seed is loaded '
      'WHEN it has expired '
      'THEN a FetchSeedAction is dispatched', (WidgetTester tester) async {
    expireMiddleware.call(store, SeedLoadedAction(seed), (_) {});

    await tester.pump(Duration(seconds: 11));

    verify(store.dispatch(FetchSeedAction()));
  });
}
