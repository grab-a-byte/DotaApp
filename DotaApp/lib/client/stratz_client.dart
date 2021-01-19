import 'dart:collection';
import 'dart:convert';

import '../infrastructure/get_it.dart';
import '../infrastructure/http_cache_interface.dart';
import '../infrastructure/http_client_interface.dart';
import 'models/hero.dart';
import 'stratz_client_interface.dart';

class StratzClient implements IStratzClient {
  final String heroesEndpoint = "https://api.stratz.com/api/v1/hero";

  final IHttpClient _client;
  final IHttpCache _cache;

  StratzClient(IHttpClient client, IHttpCache cache)
      : _client = client ?? getIt.get<IHttpClient>(),
        _cache = cache ?? getIt.get<IHttpCache>();

  @override
  Future<List<Hero>> getHeroes() async {
    String response =
        await _cache.get(heroesEndpoint, (x) => _client.get(Uri.parse(x)));
    LinkedHashMap json = jsonDecode(response);
    return json.values.map((e) => Hero.fromJson(e)).toList();
  }
}
