import 'package:dota_app/client/models/hero/hero.dart';
import 'package:dota_app/client/models/hero_role/hero_role.dart';
import 'package:dota_app/client/stratz_client_interface.dart';
import 'package:dota_app/client/stratz_client.dart';
import 'package:dota_app/infrastructure/http_cache_interface.dart';
import 'package:dota_app/infrastructure/http_client_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks_implementations/mock_http_cache.dart';
import '../mocks_implementations/mock_http_client.dart';
import 'models/hero/hero_json.dart';
import 'models/hero_role/hero_role_json.dart';

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

  //TODO Add Heroes Abilities
}
