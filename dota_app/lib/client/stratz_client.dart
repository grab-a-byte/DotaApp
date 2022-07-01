import 'dart:async';
import 'dart:convert';

import '../infrastructure/get_it.dart';
import '../infrastructure/http_cache_interface.dart';
import '../infrastructure/http_client_interface.dart';
import 'models/hero/hero.dart';
import 'models/hero_ability/hero_ability.dart';
import 'models/hero_boots/hero_boots.dart';
import 'models/hero_role/hero_role.dart';
import 'models/item/item.dart';
import 'stratz_client_interface.dart';

class StratzClient implements IStratzClient {
  final String _heroesEndpoint = 'https://api.stratz.com/api/v1/hero';
  final String _rolesEndpoint = 'https://api.stratz.com/api/v1/hero/roles';
  final String _abilitiesEndpoint = 'https://api.stratz.com/api/v1/ability';
  String _heroBootsEndpoint(int heroId) =>
      'https://api.stratz.com/api/v1/hero/$heroId/itemBootPurchase';

  final String _itemsEndpoint = 'https://api.stratz.com/api/v1/item';

  late final IHttpClient _client;
  late final IHttpCache _cache;

  StratzClient(IHttpClient? client, IHttpCache? cache)
      : _client = client ?? getIt.get<IHttpClient>(),
        _cache = cache ?? getIt.get<IHttpCache>();

  @override
  Future<List<Hero>> getHeroes() async {
    String response =
        await (_cache.get(_heroesEndpoint, (x) => _client.get(Uri.parse(x))));
    Map json = jsonDecode(response);
    return json.values.map((e) => Hero.fromJson(e)).toList();
  }

  @override
  Future<List<HeroRole>> getHeroRoles() async {
    String repsonse =
        await (_cache.get(_rolesEndpoint, ((x) => _client.get(Uri.parse(x)))));

    List json = jsonDecode(repsonse) as List;
    return json.map((jsonItem) => HeroRole.fromJson(jsonItem)).toList();
  }

  @override
  Future<List<HeroAbility>> getHeroAbilities() async {
    String response = await (_cache.get(
        _abilitiesEndpoint, (x) => _client.get(Uri.parse(x))));
    Map json = jsonDecode(response);

    return json.values.map((e) => HeroAbility.fromJson(e)).toList();
  }

  @override
  Future<HeroBoots> getHeroBoots(int heroId) async {
    String response = await _cache.get(
        _heroBootsEndpoint(heroId), (url) => _client.get(Uri.parse(url)));

    var json = jsonDecode(response);

    return HeroBoots.fromJson(json);
  }

  @override
  Future<List<Item>> getItems() async {
    String response =
        await (_cache.get(_itemsEndpoint, (x) => _client.get(Uri.parse(x))));
    Map json = jsonDecode(response);
    return json.values.map((e) => Item.fromJson(e)).toList();
  }
}
