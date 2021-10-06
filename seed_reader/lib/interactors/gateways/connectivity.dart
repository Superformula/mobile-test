import 'package:connectivity/connectivity.dart';

typedef CanFetchType = Future<bool> Function();

Future<bool> canConnectToApi(Connectivity connectivity) {
  return connectivity.checkConnectivity().then(
    (ConnectivityResult result) {
      return result == ConnectivityResult.wifi;
    },
  );
}
