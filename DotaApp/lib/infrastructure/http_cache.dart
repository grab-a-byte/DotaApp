import '../services/database_service_interface.dart';
import '../services/models/http_cache_record.dart';
import './time.dart';
import 'get_it.dart';
import 'http_cache_interface.dart';

class HttpCache implements IHttpCache {
  final Duration _cacheDuration = Duration(hours: 1);

  final IDatabseService _databaseService;

  HttpCache(IDatabseService databseService)
      : _databaseService = databseService ?? getIt.get<IDatabseService>();

  bool _isExpired(HttpCacheRecord record) {
    return record.dateTime.isBefore(getNow().subtract(_cacheDuration));
  }

  @override
  Future<String> get(String url, GetFunction func) async {
    var record = await _databaseService.get(url);
    if (record.unsuccessful || _isExpired(record.data)) {
      var result = await func(url);

      var newRecord = HttpCacheRecord(url, DateTime.now(), result);
      if (record.data == null) {
        _databaseService.insert(newRecord);
      } else {
        _databaseService.update(newRecord);
      }
    }
    return record.data.response;
  }
}
