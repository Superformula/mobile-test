import 'package:dependencies/dependencies.dart';
import 'package:qrgenerator/data/prefs/prefs_settings_repository.dart';
import 'package:qrgenerator/domain/abstractions/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsModule implements Module {
  final SharedPreferences _sharedPreferences;

  PrefsModule(this._sharedPreferences);

  @override
  void configure(Binder binder) {
    binder.bindSingleton<SettingsRepository>(PrefsSettingsRepository(_sharedPreferences));
  }
}
