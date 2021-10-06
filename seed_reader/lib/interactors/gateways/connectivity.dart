import 'package:connectivity/connectivity.dart';

typedef CanFetchType = Future<bool> Function();

Future<bool> canFetch(Connectivity connectivity) {
  return connectivity.checkConnectivity().then(
    (ConnectivityResult result) {
      return result == ConnectivityResult.wifi;
    },
  );
}
