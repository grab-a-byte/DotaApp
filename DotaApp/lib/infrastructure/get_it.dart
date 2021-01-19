import 'dart:io';

import 'package:get_it/get_it.dart';

import '../client/stratz_client.dart';
import '../client/stratz_client_interface.dart';
import '../services/database_service.dart';
import '../services/database_service_interface.dart';
import 'http_cache.dart';
import 'http_cache_interface.dart';
import 'http_client.dart';
import 'http_client_interface.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<IDatabseService>(() => DatabaseService());
  getIt.registerLazySingleton<IHttpClient>(() => HttpClient());
  getIt.registerLazySingleton<IHttpCache>(
      () => HttpCache(getIt.get<IDatabseService>()));
  getIt.registerFactory<IStratzClient>(
      () => StratzClient(getIt.get<IHttpClient>(), getIt.get<IHttpCache>()));
}
