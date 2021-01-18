import '../infrastructure/result.dart';

import 'models/http_cache_record.dart';

mixin IDatabseService {
  Future<Result<HttpCacheRecord>> get(String url);
  void insert(HttpCacheRecord record);
  void update(HttpCacheRecord record);
}
