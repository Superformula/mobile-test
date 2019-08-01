import 'dart:convert';

import 'package:qrgenerator/core/env/build_info.dart';
import 'package:qrgenerator/domain/abstractions/settings_repository.dart';
import 'package:qrgenerator/domain/models/seed.dart';
import 'package:qrgenerator/domain/models/serializers.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Install SharedPrefencess implementations.
///
class PrefsSettingsRepository extends SettingsRepository {
  static const String FIRST_RUN = "App.firstRun";
  static const String LAST_SEED = "App.lastSeed";

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

  @override
  Seed get lastSeed {
    Seed seed;
    String json = _sharedPrefs.getString(LAST_SEED) ?? "";
    if (json.isNotEmpty) {
      seed = serializers.deserializeWith(Seed.serializer, jsonDecode(json));
    }
    return seed;
  }

  @override
  set lastSeed(Seed seed) {
    String json = jsonEncode(serializers.serializeWith(Seed.serializer, seed));
    if (json.isNotEmpty) {
      _sharedPrefs.setString(LAST_SEED, json);
    }
  }
}
