import 'package:connectivity/connectivity.dart';

///Returns true if device is connected to wifi or mobile
Future<bool> connected() async {
  var result = await Connectivity().checkConnectivity();
  switch (result) {
    case ConnectivityResult.mobile:
      {
        return true;
      }
    case ConnectivityResult.wifi:
      {
        return true;
      }
    case ConnectivityResult.none:
      {
        return false;
      }
  }
}
