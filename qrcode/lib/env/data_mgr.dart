import 'package:qrcode/env/env.dart';
import 'package:qrcode/env/backend_mgr.dart';
import 'package:qrcode/main.dart';
import 'package:qrcode/model/model.dart';

abstract class DataMgr extends Manager {
  Future<Seed> fetchSeed();
}

class DevDataMgr extends DataMgr {
  @override
  Future<Seed> fetchSeed() {
    BackendMgr remoteStorage = App.getEnv().getManager(Env.MGR_KEY_REMOTE_STORAGE);
    return remoteStorage.fetchSeed();
  }

}