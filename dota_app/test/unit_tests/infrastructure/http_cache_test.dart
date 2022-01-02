import 'package:dota_app/infrastructure/hive_http_cache.dart';
import 'package:dota_app/infrastructure/hive_setup.dart';
import 'package:dota_app/infrastructure/http_cache_interface.dart';
import 'package:dota_app/infrastructure/time.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  setUpAll(() async {
    await initializeHive();
  });

  tearDownAll(() async {
    Hive.deleteFromDisk();
    await Hive.close();
  });

  test("Retrieves from cache when not expired", () async {
    fakeTime = DateTime(2021, 1, 1, 12, 0, 0, 0, 0);

    IHttpCache cache = HiveHttpCache(cacheDuration: Duration(hours: 12));

    cache.get("anything", (url) => Future.value("testData"));

    String? result =
        await cache.get("anything", (_) => Future.value("not correct"));

    expect(result, "testData");
  });

  // test("Calls retrieval function when expired", () async {
  //   fakeTime = DateTime(2021, 1, 1, 12, 0, 0, 0, 0);

  //   IHttpCache cache = HiveHttpCache(cacheDuration: Duration(seconds: 1));
  //   String? result =
  //       await cache.get("anything", (_) => Future.value("correct"));

  //   expect(result, "correct");
  // });

  // test("Calls retrieval function if there is no record", () async {
  //   IHttpCache cache = HiveHttpCache(cacheDuration: Duration(seconds: 1));
  //   String? result =
  //       await cache.get("anything", (_) => Future.value("correct"));

  //   expect(result, "correct");
  // });
}
