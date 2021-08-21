import 'package:dota_app/client/models/hero/hero.dart';
import 'package:dota_app/client/models/hero/hero_role.dart' as h_role;
import 'package:dota_app/client/models/hero_ability/language.dart';
import 'package:dota_app/client/models/hero_ability/stat.dart';
import 'package:dota_app/client/models/hero_boots/hero_boots.dart';
import 'package:dota_app/client/models/hero_role/hero_role.dart' as role;
import 'package:dota_app/client/models/hero_ability/hero_ability.dart'
    as ability;
import 'package:dota_app/client/stratz_client_interface.dart';
import 'package:dota_app/cubits/hero_cubit/hero_cubit.dart';
import 'package:dota_app/cubits/hero_cubit/hero_cubit_state.dart';
import 'package:dota_app/mappers/hero_ability_mapper.dart';
import 'package:dota_app/mappers/hero_boots_mapper.dart';
import 'package:dota_app/mappers/hero_mapper.dart';
import 'package:dota_app/mappers/hero_stat_mapper.dart';
import 'package:dota_app/view_models/hero_page/hero_ability_view_model.dart';
import 'package:dota_app/view_models/hero_page/hero_view_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks_implementations/mock_stratz_client.dart';

void main() {
  group("HeroCubit", () {
    Hero hero = Hero(1, "test", "test", [h_role.HeroRole(0, 1)], [], null);
    role.HeroRole heroRole = role.HeroRole(0, "carry", "roles.carry");
    ability.HeroAbility heroAbility = ability.HeroAbility(
        0,
        "test",
        Language("test", ["test"], "test", ["test"], ["test"]),
        Stat([1.0], [1.0], [1.0]));

    IStratzClient client = MockStratzClient(
        heroAbilityResponse: [heroAbility],
        heroRoleResponse: [heroRole],
        heroResponse: [hero],
        heroBootsResponse: HeroBoots(0, []),
        itemsResponse: []);

    var expectedRepsonse = HeroViewModel(
        hero.displayName,
        hero.shortName,
        [heroRole.name],
        [
          HeroAbilityViewModel(
              heroAbility.name,
              heroAbility.language!.displayName,
              heroAbility.language!.description!.first,
              heroAbility.language!.lore,
              heroAbility.language!.attributes,
              [1.0],
              [1.0],
              [1.0],
              ["test"])
        ],
        null,
        null);
    blocTest("Emits Loading then Hero when getting Hero",
        build: () => HeroCubit(
            client: client,
            mapper: HeroMapper(
                HeroAbilityMapper(), HeroStatMapper(), HeroBootsMapper())),
        act: (dynamic cubit) async => await cubit.getHero(1),
        expect: () => [
              HeroLoading(),
              HeroLoaded(expectedRepsonse),
            ]);
  });
}
