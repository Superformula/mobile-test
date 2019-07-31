import 'package:dependencies/dependencies.dart';
import 'package:qrgenerator/core/env/env.dart';
import 'package:qrgenerator/core/inject/inject.dart';
import 'package:qrgenerator/data/data_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Init our injector modules.
///
/// INFO: We init the injector in the outter most app layer
/// so that we can support installing modules that depend on Flutter.
///
void initInjector(Flavor flavor, SharedPreferences sharedPreferences) {
  List<Module> modules = [
    DataModule(flavor, sharedPreferences),
  ];
  Inject.init(modules);
}
