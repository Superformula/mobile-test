import 'package:qrcode/env/env.dart';
import 'package:qrcode/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Defines a manager to encapsulate storing data locally
///
abstract class LocalStorageMgr extends Manager {
  ///
  /// Persist the latest seed to local storage
  ///
  Future<Null> persistLatestSeed(Seed seed);
  ///
  /// Fetch the latest seed from local storage
  ///
  Future<Seed> fetchLatestSeed();
}

///
/// Utilizes SharedPreferences to store the seed information locally
///
class SharedPrefsStorageMgr extends LocalStorageMgr {
  static const KEY_SEED_VALUE = "key_seed_value";
  static const KEY_EXPIRES_AT_VALUE = "key_expires_at_value";

  SharedPreferences _prefs;

  Future<SharedPreferences> getSharedPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return Future.value(_prefs);
  }

  @override
  Future<Seed> fetchLatestSeed() async {
    final prefs = await getSharedPrefs();

    return Seed.success(
        prefs.getString(KEY_SEED_VALUE) ?? "",
        prefs.getInt(KEY_EXPIRES_AT_VALUE) ?? 0);
  }

  @override
  Future<Null> persistLatestSeed(Seed seed) async {
    final prefs = await getSharedPrefs();
    prefs.setString(KEY_SEED_VALUE, seed.seed);
    prefs.setInt(KEY_EXPIRES_AT_VALUE, seed.expiresAt);
    return null;
  }
}

class DevLocalStorageMgr extends LocalStorageMgr {
  Seed _seed;

  @override
  Future<Seed> fetchLatestSeed() {
    return Future.value(_seed);
  }

  @override
  Future<Null> persistLatestSeed(Seed seed) {
    _seed = seed;
    return null;
  }
}