import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:seed_reader/interactors/gateways/connectivity.dart';
import '../../mocks/mock_generator.mocks.dart';

void main() {
  group('#canConnectToApi', () {
    test('when connectivity returns wifi then emits true', () {
      final MockConnectivity connectivity = MockConnectivity();
      when(connectivity.checkConnectivity()).thenAnswer(
        (_) => Future<ConnectivityResult>.value(
          ConnectivityResult.wifi,
        ),
      );

      expect(canConnectToApi(connectivity), completion(true));
    });
    test('when connectivity returns none then emits false', () {
      final MockConnectivity connectivity = MockConnectivity();
      when(connectivity.checkConnectivity()).thenAnswer(
        (_) => Future<ConnectivityResult>.value(
          ConnectivityResult.none,
        ),
      );

      expect(canConnectToApi(connectivity), completion(false));
    });
    test('when connectivity returns mobile then emits true', () {
      final MockConnectivity connectivity = MockConnectivity();
      when(connectivity.checkConnectivity()).thenAnswer(
        (_) => Future<ConnectivityResult>.value(
          ConnectivityResult.mobile,
        ),
      );

      expect(canConnectToApi(connectivity), completion(true));
    });
  });
}
