import 'dart:io';

import 'package:DotaApp/infrastructure/http_cache_record.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration/sqflite_migration.dart';

import 'http_cache_interface.dart';
import 'result.dart';

class HttpCache implements IHttpCache {
  Duration _cacheDuration = Duration(hours: 1);

  static final _databaseName = "dota_app_cache.db";
  static final _tableName = "DotaAppCache";

  static final List<String> initialScript = [
    '''
      CREATE TABLE $_tableName (
        ${HttpCacheRecord.UniqueUrlColumnName} TEXT PRIMARY KEY,
        ${HttpCacheRecord.CalledDateTimeColumnName} TEXT NOT NULL,
        ${HttpCacheRecord.ResponseColumnName} TEXT NOT NULL,
      )
      '''
  ];

  // In case of future migrations
  static final List<String> migrations = [
    //"ALTER TABLE ${VisitorRecord.tableName} ADD ${VisitorRecord.timeOutColumnName} TEXT",
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
    _database = await _initDatabase();
    return _database;
  }

  Future<Result<HttpCacheRecord>> getFromCache(String url) async {
    Database database = await _getDatabase();
    var result = await database
        .rawQuery("SELECT * FROM DotaAppCache WHERE UniqueUrl = $url");

    return result.isEmpty
        ? Result.error()
        : Result.success(HttpCacheRecord.fromMap(result.first));
  }

  bool _isExpired(HttpCacheRecord record) {
    return record.dateTime.isBefore(DateTime.now().subtract(_cacheDuration));
  }

  @override
  Future<String> get(String url, GetFunction func) async {
    var record = await getFromCache(url);
    if (record.unsuccessful || _isExpired(record.data)) {
      var result = await func(url);
      var db = await _getDatabase();
      var newRecord = HttpCacheRecord(url, DateTime.now(), result);
      if (record.data == null) {
        db.insert(_tableName, newRecord.toMap());
      } else {
        db.update(_tableName, newRecord.toMap());
      }
    }
    return record.data.response;
  }
}
