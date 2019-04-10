import 'package:qrcode/env/env.dart';
import 'package:qrcode/env/backend_mgr.dart';
import 'package:qrcode/env/localstorage_mgr.dart';
import 'package:qrcode/main.dart';
import 'package:qrcode/model/model.dart';

///
/// Manager which abstracts the means of fetching the seed information
///
abstract class DataMgr extends Manager {
  BackendMgr getBackendMgr() => App.getEnv().getManager(Env.MGR_KEY_REMOTE_STORAGE);
  LocalStorageMgr getLocalStorageMgr() => App.getEnv().getManager(Env.MGR_KEY_LOCAL_STORAGE);

  Future<Seed> fetchSeed();
}

///
/// DataMgr which utilizes full production functionality
///
class DefaultDataMgr extends DataMgr {
  @override
  Future<Seed> fetchSeed() async {
    Seed seed = await getBackendMgr().fetchSeed();
    if (!seed.success) {
      getLocalStorageMgr().persistLatestSeed(seed);
    } else {
      seed = await getLocalStorageMgr().fetchLatestSeed();
    }

    return Future.value(seed);
  }
}

class DevDataMgr extends DataMgr {
  @override
  Future<Seed> fetchSeed() async {
    await Future.delayed(Duration(seconds: 2));
    /// return fake seed which expires in 10 seconds
    return Future.value(Seed.success("abc123", DateTime.now().millisecondsSinceEpoch + (1000 * 10)));

//    return Future.value(Seed.failure());
  }

}