import 'package:qrcode/env/data_mgr.dart';

///
/// Base Manager class.  A manager wraps similar functionality or an external component, ie
/// a RemoteEndpoint manager could encapsulate the functionality to access a backend server,
/// then during dev and/or testing a DevEndpoint or TestEndpoint could be placed in it's place
/// for the rest of the system to utilize.
///
class Manager {}

///
/// Contains Managers for a given Environment
///
class Env {
  static const String DEVICE_MGR_KEY = "mgr-key-device";
  static const String DATA_MGR_KEY = "mgr-key-datamgr";

  Map<String, Manager> _mgrMap = new Map();

  registerManager(String mgrKey, Manager mgr) {
    _mgrMap[mgrKey] = mgr;
  }

  Manager getManager(String mgrKey) {
    if (!_mgrMap.containsKey(mgrKey)) {
      String msg = "Manager with key $mgrKey not registered with Env";
      throw Exception(msg);
    }
    return _mgrMap[mgrKey];
  }
}

class DevEnv extends Env {
  DevEnv() {
    registerManager(Env.DATA_MGR_KEY, DevDataMgr());
  }
}