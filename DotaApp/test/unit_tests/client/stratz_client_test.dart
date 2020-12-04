import 'package:DotaApp/client/models/hero.dart';
import 'package:DotaApp/client/stratz_client_interface.dart';
import 'package:DotaApp/client/stratz_client.dart';
import 'package:DotaApp/infrastructure/http_client_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'models/hero_json.dart';

class MockHttpClient extends Mock implements IHttpClient {}

bool matchHeros(Hero hero1, Hero hero2) {
  return hero1.id == hero2.id &&
      hero1.name == hero2.name &&
      hero1.displayName == hero2.displayName &&
      hero1.shortName == hero2.shortName;
}

void main() {
  test("Stratz Client retrives Hero list when asked", () async {
    Hero expectedHero1 =
        Hero(1, "npc_dota_hero_antimage", "Anti-Mage", "antimage");

    Hero expectedHero2 = Hero(2, "npc_dota_hero_axe", "Axe", "axe");

    IHttpClient fakeClient = MockHttpClient();
    when(fakeClient.get(any)).thenAnswer((_) async => multipleHeroesJson);

    IStratzClient client = StratzClient(fakeClient);

    List<Hero> result = await client.getHeroes();

    expect(result.length, 2);
    expect(matchHeros(expectedHero1, result[0]), true);
    expect(matchHeros(expectedHero2, result[1]), true);
  });
}
