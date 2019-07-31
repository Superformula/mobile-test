import 'package:qrgenerator/core/env/build_info.dart';
import 'package:qrgenerator/domain/abstractions/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Install SharedPrefencess implementations.
///
class PrefsSettingsRepository extends SettingsRepository {
  static const String FIRST_RUN = "App.firstRun";

  final SharedPreferences _sharedPrefs;

  PrefsSettingsRepository(this._sharedPrefs);

  @override
  bool isFirstRun() {
    String revisionString = BuildInfo().buildNumber;
    if (revisionString.isNotEmpty) {
      int revision = int.parse(revisionString);
      if (revision > 0) {
        int value = _sharedPrefs.getInt(FIRST_RUN) ?? 0;
        if (value == 0 || value < revision) {
          _sharedPrefs.setInt(FIRST_RUN, value);
          return true;
        }
      }
    }
    return false;
  }
}
