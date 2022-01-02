import 'package:get_it/get_it.dart';

import '../client/stratz_client.dart';
import '../client/stratz_client_interface.dart';
import 'hive_http_cache.dart';
import 'http_cache_interface.dart';
import 'http_client.dart';
import 'http_client_interface.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<IHttpClient>(() => HttpClient());

  getIt.registerLazySingleton<IHttpCache>(() => HiveHttpCache());

  getIt.registerFactory<IStratzClient>(
      () => StratzClient(getIt.get<IHttpClient>(), getIt.get<IHttpCache>()));
}
