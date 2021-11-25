import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_test/controller/services/network_info.dart';

class MockConnectivity extends Mock implements Connectivity {}

void stubConnectivityCheckConnectivity() {}

void main() {
  group('Testing network functionality', () {
    test('Should return true if connected to wifi ', () async {
      MockConnectivity mockConnectivity = MockConnectivity();
      NetworkInfoImpl networkInfoImpl = NetworkInfoImpl(mockConnectivity);
      when(mockConnectivity.checkConnectivity)
          .thenAnswer((_) => Future.value(ConnectivityResult.wifi));

      final result = await networkInfoImpl.isConnected;
      networkInfoImpl.connectivity;

      verify(mockConnectivity.checkConnectivity);
      expect(result, true);
    });

    test('Should return true if connected to mobile', () async {
      MockConnectivity mockConnectivity = MockConnectivity();
      NetworkInfoImpl networkInfoImpl = NetworkInfoImpl(mockConnectivity);
      when(mockConnectivity.checkConnectivity)
          .thenAnswer((_) => Future.value(ConnectivityResult.wifi));

      final result = await networkInfoImpl.isConnected;
      networkInfoImpl.connectivity;

      verify(mockConnectivity.checkConnectivity);
      expect(result, true);
    });
    test('Should return false if not connected to wifi or mobile network ',
        () async {
      MockConnectivity mockConnectivity = MockConnectivity();
      NetworkInfoImpl networkInfoImpl = NetworkInfoImpl(mockConnectivity);
      when(mockConnectivity.checkConnectivity)
          .thenAnswer((_) => Future.value(ConnectivityResult.none));

      final result = await networkInfoImpl.isConnected;
      networkInfoImpl.connectivity;

      verify(mockConnectivity.checkConnectivity);
      expect(result, false);
    });
  });
}
