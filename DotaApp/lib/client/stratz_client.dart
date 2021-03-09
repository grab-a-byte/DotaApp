import 'dart:collection';
import 'dart:convert';

import '../infrastructure/get_it.dart';
import '../infrastructure/http_cache_interface.dart';
import '../infrastructure/http_client_interface.dart';
import 'models/hero/hero.dart';
import 'models/hero_role/hero_role.dart';
import 'stratz_client_interface.dart';

class StratzClient implements IStratzClient {
  final String _heroesEndpoint = "https://api.stratz.com/api/v1/hero";
  final String _rolesEndpoint = "https://api.stratz.com/api/v1/hero/roles";

  final IHttpClient _client;
  final IHttpCache _cache;

  StratzClient(IHttpClient client, IHttpCache cache)
      : _client = client ?? getIt.get<IHttpClient>(),
        _cache = cache ?? getIt.get<IHttpCache>();

  @override
  Future<List<Hero>> getHeroes() async {
    String response =
        await _cache.get(_heroesEndpoint, (x) => _client.get(Uri.parse(x)));
    LinkedHashMap json = jsonDecode(response);
    return json.values.map((e) => Hero.fromJson(e)).toList();
  }

  @override
  Future<List<HeroRole>> getHeroRoles() async {
    String repsonse =
        await _cache.get(_rolesEndpoint, ((x) => _client.get(Uri.parse(x))));

    Iterable json = jsonDecode(repsonse);
    return json.map((jsonItem) => HeroRole.fromJson(jsonItem)).toList();
  }
}
