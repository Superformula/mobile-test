import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:qrgenerator/app/inject/injector.dart';
import 'package:qrgenerator/core/env/build_info.dart';
import 'package:qrgenerator/core/env/env.dart';
import 'package:qrgenerator/core/logging/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initApp(Flavor flavor) async {
  _initEnvironment(flavor);
  _initLogging(flavor);

  _initFlutter(flavor);
  _initOrientation();

  _initBuildInfo();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  initInjector(flavor, sharedPreferences);
}

_initEnvironment(Flavor flavor) {
  Environment.init(flavor);
}

_initLogging(Flavor flavor) {
  if (flavor == Flavor.develop) {
    Logger.level = Level.verbose;
  } else if (flavor == Flavor.production) {
    Logger.level = Level.warning;
  }
}

// DEBUG: You can edit these flags in develop builds only.
_initFlutter(Flavor flavor) {
  if (flavor == Flavor.develop) {
    debugPaintSizeEnabled = false;
    debugPaintBaselinesEnabled = false;
    debugPaintLayerBordersEnabled = false;
    debugPaintPointersEnabled = false;
  }
}

// XXX: Lock us to portrait for now.
_initOrientation() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

_initBuildInfo() async {
  await BuildInfo().initialized;
}
