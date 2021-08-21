import 'package:dota_app/client/models/hero_boots/hero_boots.dart';
import 'package:dota_app/client/models/item/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../client/models/hero/hero.dart';
import '../../client/models/hero_ability/hero_ability.dart';
import '../../client/models/hero_role/hero_role.dart';
import '../../client/stratz_client_interface.dart';
import '../../mappers/hero_mapper.dart';
import 'hero_cubit_state.dart';

HeroCubitState defaultState = HeroLoading();

class HeroCubit extends Cubit<HeroCubitState> {
  final IStratzClient client;
  final HeroMapper mapper;

  HeroCubit({required this.client, required this.mapper}) : super(defaultState);

  void getHero(int id) async {
    emit(HeroLoading());
    List<Hero> heroes = await client.getHeroes();
    Hero hero = heroes.firstWhere((x) => x.id == id);
    List<HeroRole> roles = await client.getHeroRoles();
    HeroBoots boots = await client.getHeroBoots(id);
    List<Item> items = await client.getItems();

    List<HeroAbility> abilities = await client.getHeroAbilities();

    List<HeroAbility> heroAbilities = abilities
        .where((ability) => hero.abilities!
            .map((heroAbility) => heroAbility.abilityId)
            .contains(ability.id))
        .toList();

    List<HeroRole> heroRoles = roles
        .where((role) => hero.roles!.map((x) => x.roleId).contains(role.id))
        .toList();

    var vm = mapper.toViewModel(hero, heroAbilities, heroRoles, boots, items);

    emit(HeroLoaded(vm));
  }
}
