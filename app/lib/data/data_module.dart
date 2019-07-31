import 'package:dependencies/dependencies.dart';
import 'package:qrgenerator/core/env/env.dart';
import 'package:qrgenerator/data/network/network_module.dart';
import 'package:qrgenerator/data/prefs/prefs_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Install our data implementations.
///
class DataModule implements Module {
  final Flavor _flavor;
  final SharedPreferences _sharedPreferences;

  DataModule(this._flavor, this._sharedPreferences);

  @override
  void configure(Binder binder) {
    binder.install(Module.compose([
      PrefsModule(_sharedPreferences),
      NetworkModule(_flavor),
    ]));
  }
}
