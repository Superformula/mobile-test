import 'package:qrcode/env/env.dart';
import 'package:qrcode/env/backend_mgr.dart';
import 'package:qrcode/main.dart';
import 'package:qrcode/model/model.dart';

///
/// Manager which abstracts the means of fetching the seed information
///
abstract class DataMgr extends Manager {
  Future<Seed> fetchSeed();
}

///
/// DataMgr which utilizes full production functionality
///
class DefaultDataMgr extends DataMgr {
  @override
  Future<Seed> fetchSeed() {
    BackendMgr remoteStorage = App.getEnv().getManager(Env.MGR_KEY_REMOTE_STORAGE);
    return remoteStorage.fetchSeed();
  }
}

class DevDataMgr extends DataMgr {
  @override
  Future<Seed> fetchSeed() async {
    await Future.delayed(Duration(seconds: 2));
    /// return fake seed which expires in 10 seconds
    return Future.value(Seed.success("abc123", DateTime.now().millisecondsSinceEpoch + (1000 * 10)));
  }

}