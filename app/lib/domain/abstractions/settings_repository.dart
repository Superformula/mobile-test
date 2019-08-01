import 'package:qrgenerator/domain/models/seed.dart';

///
/// SettingsRepository provides access to device preferences.
///
abstract class SettingsRepository {
  bool isFirstRun();

  Seed get lastSeed;
  set lastSeed(Seed seed);
}
