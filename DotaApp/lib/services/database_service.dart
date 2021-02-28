import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration/sqflite_migration.dart';

import '../infrastructure/result.dart';
import 'database_service_interface.dart';
import 'models/http_cache_record.dart';

class DatabaseService implements IDatabseService {
  static final _databaseName = "dota_app_cache.db";
  static final _tableName = "DotaAppCache";

  static final List<String> initialScript = [
    '''
      CREATE TABLE $_tableName (
        ${HttpCacheRecord.uniqueUrlColumnName} TEXT PRIMARY KEY,
        ${HttpCacheRecord.calledDateTimeColumnName} TEXT NOT NULL,
        ${HttpCacheRecord.responseColumnName} TEXT NOT NULL
      )
      '''
  ];

  // In case of future migrations
  static final List<String> migrations = [
    //"ALTER TABLE blah blah" -- SQL code for migrations.
  ];

  final config = MigrationConfig(
      initializationScript: initialScript, migrationScripts: migrations);

  static Database _database;

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabaseWithMigration(path, config);
  }

  Future<Database> _getDatabase() async {
    if (_database != null) return _database;
    _database = (await _initDatabase()) as Database;
    return _database;
  }

  @override
  void update(HttpCacheRecord record) async {
    var db = await _getDatabase();
    db.update(_tableName, record.toMap());
  }

  @override
  void insert(HttpCacheRecord record) async {
    var db = await _getDatabase();
    db.insert(_tableName, record.toMap());
  }

  @override
  Future<Result<HttpCacheRecord>> get(String url) async {
    Database database = await _getDatabase();
    var result = await database
        .rawQuery('SELECT * FROM DotaAppCache WHERE uniqueUrl = "$url"');

    return result.isEmpty
        ? Result.error()
        : Result.success(HttpCacheRecord.fromMap(result.first));
  }
}
