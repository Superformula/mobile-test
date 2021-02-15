import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/api_middleware.dart';

import '../../fixtures.dart';
import '../../mocks.dart';

void main() {
  StoreMock store;
  ApiClientMock apiClient;
  ApiMiddleware apiMiddleware;

  setUp(() {
    store = StoreMock();
    apiClient = ApiClientMock();
    apiMiddleware = ApiMiddleware(apiClient);
  });

  test(
      'WHEN FetchSeedAction is called '
      'AND api returns a new seed '
      'THEN the seed is loaded', () async {
    final expectedSeed = Fixtures.goldenSeed();
    when(apiClient.fetchSeed()).thenAnswer((_) => Future.value(expectedSeed));

    final action = FetchSeedAction();
    await apiMiddleware.call(store, action, (_) {});

    verify(store.dispatch(SeedLoadedAction(expectedSeed)));
  });
}
