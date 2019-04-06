import 'package:qrcode/env/data_mgr.dart';
import 'package:qrcode/env/remote_storage.dart';

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
  static const String MGR_KEY_DEVICE = "mgr-key-device";
  static const String MGR_KEY_DATA = "mgr-key-datamgr";
  static const String MGR_KEY_REMOTE_STORAGE = "mgr-key-remote-storage";

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
    registerManager(Env.MGR_KEY_DATA, DevDataMgr());
    registerManager(Env.MGR_KEY_REMOTE_STORAGE, FirebaseRemoteStorageMgr());
  }
}