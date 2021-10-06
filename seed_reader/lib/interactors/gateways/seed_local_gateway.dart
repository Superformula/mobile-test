import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../models/seed.dart';

const String _storageKey = 'seed';

class SeedLocalGateway {
  const SeedLocalGateway({
    required Future<SharedPreferences> Function() prefs,
  }) : _prefs = prefs;
  final Future<SharedPreferences> Function() _prefs;

  Future<Seed?> fetchSeed() => _prefs()
          .then((SharedPreferences prefs) => prefs.getString(_storageKey))
          .then(
        (String? seed) {
          if (seed != null) {
            return Seed.fromJson(json.decode(seed) as Map<String, dynamic>);
          }
          return null;
        },
      );

  Future<void> saveSeed(Seed seed) => _prefs().then(
        (SharedPreferences prefs) => prefs.setString(
          _storageKey,
          json.encode(seed),
        ),
      );
}
