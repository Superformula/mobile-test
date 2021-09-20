import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superformula_mobile_test/infrastructure/platform/network_info_impl.dart';

import '../../setup/test_helpers.dart';

void main() {
  group('INetworkInfoTest -', () {
    setUp(registerServices);
    tearDown(unregisterServices);

    group('isConnected -', () {
      test('When called forwards the call to DataConnectionChecker.hasConnection', () {
        // arrange
        final tHasConnectionFuture = Future.value(false);
        final connectionChecker = getAndRegisterDataConnectionChecker(hasConnectionFuture: tHasConnectionFuture);
        final networkInfo = NetworkInfoImpl();

        // act
        final result = networkInfo.isConnected;

        // assert
        verify(connectionChecker.hasConnection);
        expect(result, tHasConnectionFuture);
      });
    });
  });
}
