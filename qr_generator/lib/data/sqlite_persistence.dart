import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SqlitePersistence {
  static const databaseName = 'superformula.db';
  static const seedTableName = 'seed';
  Database db;

  SqlitePersistence._(this.db);

  static Future<SqlitePersistence> create() async =>
      SqlitePersistence._(await database());

  static Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $seedTableName(
            id TEXT PRIMARY KEY,
            expires_at STRING
          )''',
        );
      },
      version: 1,
    );
  }

  // Getting list of  values
  Future<List<Map<String, dynamic>>> getUniqueObjects() async {
    final ret = await db.rawQuery('SELECT * FROM $seedTableName ');
    return ret;
  }

// Getting list of  values by query
  Future<List<Map<String, dynamic>>> findObjects(String query) async {
    final ret =
        await db.rawQuery('SELECT * FROM $seedTableName ', ['%$query%']);

    return ret;
  }

// Creating or updating a Object by key
  Future<void> createOrUpdateObject(
      String key, Map<String, dynamic> object) async {
    await db.insert(seedTableName, object,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

// Creating or updating multiple Objects
  Future<void> createOrUpdateBatchObject(
      List<Map<String, dynamic>> objects) async {
    /// Initialize batch
    final batch = db.batch();
    for (var item in objects) {
      batch.insert(seedTableName, item,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    /// Commit
    await batch.commit(noResult: true);
  }
// Deleting a record
  Future<void> removeObject(String key) async {
    await db.delete(
      seedTableName,
      where: 'id = ?',
      whereArgs: [key],
    );
  }
}
