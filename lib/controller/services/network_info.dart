import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  ///Checks for a network connection via mobile or wifi
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);
  @override
  Future<bool> get isConnected async {
    var result = await connectivity.checkConnectivity();
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
}
