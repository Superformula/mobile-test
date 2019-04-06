class Manager {}


abstract class Env {
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

}