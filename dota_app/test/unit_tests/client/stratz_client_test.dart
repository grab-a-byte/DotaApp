import 'package:dota_app/client/models/hero/hero.dart';
import 'package:dota_app/client/models/hero_boots/hero_boots.dart';
import 'package:dota_app/client/models/hero_role/hero_role.dart';
import 'package:dota_app/client/models/item/item.dart';
import 'package:dota_app/client/stratz_client.dart';
import 'package:dota_app/client/stratz_client_interface.dart';
import 'package:dota_app/infrastructure/http_cache_interface.dart';
import 'package:dota_app/infrastructure/http_client_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks_implementations/mock_http_cache.dart';
import '../mocks_implementations/mock_http_client.dart';
import 'models/hero/hero_json.dart';
import 'models/hero_boots/hero_boots_json.dart';
import 'models/hero_role/hero_role_json.dart';
import 'models/item/items_json.dart';

bool matchHeros(Hero hero1, Hero hero2) {
  return hero1.id == hero2.id &&
      hero1.displayName == hero2.displayName &&
      hero1.shortName == hero2.shortName;
}

void main() {
  test("Stratz Client retrives Hero list when asked", () async {
    Hero expectedHero1 = Hero(1, "Anti-Mage", "antimage", [], [], null);

    Hero expectedHero2 = Hero(2, "Axe", "axe", [], [], null);

    IHttpCache fakeCache = MockHttpCache(getValue: multipleHeroesJson);
    IHttpClient fakeClient = MockHttpClient(getValue: multipleHeroesJson);

    IStratzClient client = StratzClient(fakeClient, fakeCache);

    List<Hero> result = await client.getHeroes();

    expect(result.length, 2);
    expect(matchHeros(expectedHero1, result[0]), true);
    expect(matchHeros(expectedHero2, result[1]), true);
  });

  test("Stratz Client retrives Hero Roles list when asked", () async {
    HeroRole expectedRole1 = HeroRole(0, "Carry", "roles.carry");

    HeroRole expectedRole2 = HeroRole(1, "Escape", "roles.escape");

    IHttpCache fakeCache = MockHttpCache(getValue: heroRoleJson);
    IHttpClient fakeClient = MockHttpClient(getValue: heroRoleJson);

    IStratzClient client = StratzClient(fakeClient, fakeCache);

    List<HeroRole> result = await client.getHeroRoles();

    expect(result.length, 9);
    expect(expectedRole1, result[0]);
    expect(expectedRole2, result[1]);
  });

  test('Stratz Client retrieves Hero Boots when asked', () async {
    IHttpCache fakeCache = MockHttpCache(getValue: heroBootsJson);
    IHttpClient fakeClient = MockHttpClient(getValue: heroBootsJson);

    IStratzClient client = StratzClient(fakeClient, fakeCache);

    HeroBoots result = await client.getHeroBoots(42);

    expect(result.matchCount, 137471);
    expect(result.events.length, 1);

    final heroBootEvent = result.events.first;

    expect(heroBootEvent.itemId, 29);
    expect(heroBootEvent.time, 535.8329236895654);
    expect(heroBootEvent.matchCount, 137111);
    expect(heroBootEvent.wins, 0.5415028699374959);
    expect(heroBootEvent.kills, 9.851273785473083);
    expect(heroBootEvent.deaths, 5.093252911874321);
    expect(heroBootEvent.assists, 8.908234933739816);
    expect(heroBootEvent.goldEarned, 24384.69299326823);
    expect(heroBootEvent.xp, 39445.83015221244);
    expect(heroBootEvent.activations, 20.0);
  });

  test('Stratz Client retrieves items when asked', () async {
    IHttpCache fakeCache = MockHttpCache(getValue: itemsJson);
    IHttpClient fakeClient = MockHttpClient(getValue: itemsJson);

    IStratzClient client = StratzClient(fakeClient, fakeCache);

    List<Item> result = await client.getItems();

    expect(result.length, 2);

    var firstItem = result.first;
    var secondItem = result[1];

    expect(firstItem.id, 1);
    expect(firstItem.displayName, 'Blink Dagger');
    expect(firstItem.name, 'item_blink');

    expect(secondItem.id, 2);
    expect(secondItem.displayName, 'Blades of Attack');
    expect(secondItem.name, 'item_blades_of_attack');
  });

  //TODO Add Heroes Abilities
}
