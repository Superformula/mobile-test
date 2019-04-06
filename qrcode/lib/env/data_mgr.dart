import 'package:qrcode/env/env.dart';

abstract class DataMgr extends Manager {
  Future<String> fetchSeed();
}

class DevDataMgr extends DataMgr {
  @override
  Future<String> fetchSeed() {
    Future.delayed(Duration(seconds: 2));
    return Future.value("xyz987");
  }

}