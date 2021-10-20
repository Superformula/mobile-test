import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../models/seed.dart';

const String _storageKey = 'seed';

class SeedLocalGateway {
  const SeedLocalGateway({
    required Future<SharedPreferences> Function() prefs,
  }) : _prefs = prefs;
  final Future<SharedPreferences> Function() _prefs;

  Future<Seed?> fetchSeed() async {
    final SharedPreferences preferences = await _prefs();
    final String? seed = preferences.getString(_storageKey);
    if (seed != null) {
      return Seed.fromJson(json.decode(seed) as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> saveSeed(Seed seed) async {
    final SharedPreferences preferences = await _prefs();
    preferences.setString(_storageKey, json.encode(seed));
  }
}
