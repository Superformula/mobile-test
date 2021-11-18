import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code_test/model/seed_model.dart';

class HiveServices {
  static Box<Seed> getSeedFromMemory(String boxName) => Hive.box<Seed>(boxName);

  ///Adds seed to box at index
  static void addSeedToBoxAt(Seed seed, String boxName) {
    Hive.box<Seed>(boxName).putAt(0, seed);
  }

  ///Deletes seed in box at index
  static void deleteSeedInBoxAt(int index, String boxName) {
    Hive.box<Seed>(boxName).delete(index);
  }

  static void deleteBox(String boxName) {
    Hive.box<Seed>(boxName).deleteFromDisk();
  }
}
