import 'dart:async';

import 'package:package_info/package_info.dart';

class BuildInfo {
  static final BuildInfo _instance = BuildInfo._internal();

  PackageInfo _packageInfo;
  Future _initFuture;

  String get appName => _packageInfo.appName;

  String get packageName => _packageInfo.packageName;

  String get version => _packageInfo.version;

  String get buildNumber => _packageInfo.buildNumber;

  factory BuildInfo() {
    return _instance;
  }

  BuildInfo._internal() {
    _initFuture = _init();
  }

  Future _init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  Future get initialized => _initFuture;
}
