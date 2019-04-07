import 'package:qrcode/env/env.dart';
import 'package:qrcode/env/remote_storage.dart';
import 'package:qrcode/main.dart';

abstract class DataMgr extends Manager {
  Future<String> fetchSeed();
}

class DevDataMgr extends DataMgr {
  @override
  Future<String> fetchSeed() {
    RemoteStorageMgr remoteStorage = App.getEnv().getManager(Env.MGR_KEY_REMOTE_STORAGE);
    return remoteStorage.getSeed();
  }

}