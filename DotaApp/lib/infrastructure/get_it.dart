import 'dart:io';

import 'package:DotaApp/client/stratz_client.dart';
import 'package:DotaApp/client/stratz_client_interface.dart';
import 'package:DotaApp/infrastructure/http_client.dart';
import 'package:DotaApp/infrastructure/http_client_interface.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<IHttpClient>(() => HttpClient());
  getIt.registerFactory<IStratzClient>(
      () => StratzClient(getIt.get<IHttpClient>()));
}
