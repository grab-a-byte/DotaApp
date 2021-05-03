import 'package:DotaApp/client/models/hero/hero.dart';
import 'package:DotaApp/client/models/hero/hero_role.dart' as h_role;
import 'package:DotaApp/client/models/hero_ability/language.dart';
import 'package:DotaApp/client/models/hero_ability/stat.dart';
import 'package:DotaApp/client/models/hero_role/hero_role.dart' as role;
import 'package:DotaApp/client/models/hero_ability/hero_ability.dart'
    as ability;
import 'package:DotaApp/client/stratz_client_interface.dart';
import 'package:DotaApp/cubits/hero_cubit/hero_cubit.dart';
import 'package:DotaApp/cubits/hero_cubit/hero_cubit_state.dart';
import 'package:DotaApp/mappers/hero_ability_to_ability_view_model.dart';
import 'package:DotaApp/view_models/hero_page/hero_ability_view_model.dart';
import 'package:DotaApp/view_models/hero_page/hero_view_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements IStratzClient {}

void main() {
  group("HeroCubit", () {
    MockClient client = MockClient();
    Hero hero = Hero(1, "test", "test", "test", [h_role.HeroRole(0, 1)], []);
    role.HeroRole heroRole = role.HeroRole(0, "carry", "roles.carry");
    ability.HeroAbility heroAbility = ability.HeroAbility(
        0,
        "test",
        Language("test", ["test"], "test", ["test"], ["test"]),
        Stat([1.0], [1.0], [1.0]));

    when(client.getHeroes()).thenAnswer((_) async => [hero]);
    when(client.getHeroRoles()).thenAnswer((_) async => [heroRole]);
    when(client.getHeroAbilities()).thenAnswer((_) async => [heroAbility]);

    var expectedRepsonse = HeroViewModel(hero.displayName, hero.shortName, [
      heroRole.name
    ], [
      HeroAbilityViewModel(
          heroAbility.name,
          heroAbility.language.displayName,
          heroAbility.language.description.first,
          heroAbility.language.lore,
          heroAbility.language.attributes,
          [1.0],
          [1.0],
          [1.0],
          ["test"])
    ]);
    blocTest("Emits Loading then Hero when getting Hero",
        build: () => HeroCubit(client: client, mapper: HeroAbilityMapper()),
        act: (cubit) async => await cubit.getHero(1),
        expect: [
          HeroLoading(),
          HeroLoaded(expectedRepsonse),
        ]);
  });
}
