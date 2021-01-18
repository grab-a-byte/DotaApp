import 'package:DotaApp/infrastructure/http_cache.dart';
import 'package:DotaApp/infrastructure/result.dart';
import 'package:DotaApp/infrastructure/time.dart';
import 'package:DotaApp/services/database_service_interface.dart';
import 'package:DotaApp/services/models/http_cache_record.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabseService extends Mock implements IDatabseService {
  HttpCacheRecord fakeRecord;

  @override
  Future<Result<HttpCacheRecord>> get(String url) {
    return fakeRecord == null
        ? Future.value(Result.error())
        : Future.value(Result.success(fakeRecord));
  }

  @override
  void insert(HttpCacheRecord record) {}

  @override
  void update(HttpCacheRecord record) {}
}

void main() {
  test("Retrieves from cache when not expired", () async {
    var mockDbService = MockDatabseService();

    fakeTime = DateTime(2021, 1, 1, 12, 0, 0, 0, 0);
    mockDbService.fakeRecord = HttpCacheRecord(
        "anything", fakeTime.subtract(Duration(minutes: 15)), "testData");

    HttpCache cache = HttpCache(mockDbService);
    cache.get("anything", (_) => Future.value("not correct"));

    Result<HttpCacheRecord> result = await mockDbService.get("anything");

    expect(result.success, true);
    expect(result.data, mockDbService.fakeRecord);
  });
}
