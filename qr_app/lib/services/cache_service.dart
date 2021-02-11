import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:qr_app/models/seed_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

const TABLE_NAME = 'QR_TABLE';

class CacheService {
  Database _database;

  Future<int> create(SeedData data) async {
    final db = await database;
    return await db.insert(
      TABLE_NAME,
      data.toMap(),
    );
  }

  Future<List<SeedData>> retrieveAll() async {
    final db = await database;
    var res = await db.query(TABLE_NAME);
    List<SeedData> list =
        res.isNotEmpty ? res.map((map) => SeedData.fromMap(map)).toList() : [];
    return list;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initialize();
    }
    return _database;
  }

  void dispose() {
    _database?.close();
    _database = null;
  }

  Future<Database> _initialize() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, 'qr_cache.db');
    Database db = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        print('Database Open');
      },
      onCreate: _onCreate,
    );

    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE_NAME ("
        "id INTEGER PRIMARY KEY,"
        "seed TEXT,"
        "dateTime TEXT"
        ")");
  }
}
