import 'package:hive/hive.dart';

import '../services/models/http_cache_record.dart';
import 'http_cache_interface.dart';
import 'result.dart';
import 'time.dart';

class HiveHttpCache implements IHttpCache {
  HiveHttpCache({Duration? cacheDuration})
      : _cacheDuration =
            cacheDuration == null ? Duration(hours: 12) : cacheDuration;

  final Future<Box<HttpCacheRecord>> _box =
      Hive.openBox<HttpCacheRecord>("dotaAppCache");

  final Duration _cacheDuration;

  Box<HttpCacheRecord>? _openBox;

  Future<Result<HttpCacheRecord>> _tryGet(String url) async {
    _openBox ??= await _box;
    try {
      var value = _openBox!.get(url);
      if (value == null) {
        return Result.error();
      }
      return Result.success(value);
    } on Exception catch(e) {
      return Result.error();
    }
  }

  Future _put(HttpCacheRecord record) async {
    _openBox ??= await _box;
    _openBox!.put(record.uniqueUrl, record);
  }

  bool _isExpired(HttpCacheRecord record) =>
      record.dateTime.isBefore(getNow().subtract(_cacheDuration));

  @override
  Future<String> get(String url, GetFunction func) async {
    var record = await _tryGet(url);

    if (record.unsuccessful || _isExpired(record.data!)) {
      var result = await func(url);

      var newRecord = HttpCacheRecord(url, getNow(), result);
      _put(newRecord);

      return newRecord.response;
    } else {
      return record.data!.response;
    }
  }
}
