import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../client/models/hero/hero.dart';
import '../../client/models/hero_ability/hero_ability.dart';
import '../../client/models/hero_role/hero_role.dart';
import '../../client/stratz_client_interface.dart';
import '../../view_models/hero_page/hero_ability_view_model.dart';
import '../../view_models/hero_page/hero_view_model.dart';
import 'hero_cubit_state.dart';

HeroCubitState defaultState = HeroCubitState(isLoading: false, hero: null);

class HeroCubit extends Cubit<HeroCubitState> {
  IStratzClient _client;

  HeroCubit({@required IStratzClient client}) : super(defaultState) {
    _client = client;
  }

  void getHero(int id) async {
    emit(state.copyWith(isLoading: true));
    List<Hero> heroes = await _client.getHeroes();
    Hero hero = heroes.firstWhere((x) => x.id == id);
    List<HeroRole> roles = await _client.getHeroRoles();

    List<HeroAbility> abilities = await _client.getHeroAbilities();

    List<HeroAbilityViewModel> abilityVms = abilities
        .where((element) => element.language != null)
        .where((element) =>
            element.language.description.isNotEmpty &&
            element.language.attributes.isNotEmpty)
        .where((ability) => hero.abilities
            .map((heroAbility) => heroAbility.abilityId)
            .contains(ability.id))
        .map((e) {
      return HeroAbilityViewModel(
        e.language.displayName,
        e.name,
        e.language.description.first,
        e.language.lore,
        e.language.attributes,
        e.stat.cooldown,
        e.stat.manaCost,
        e.stat.damage,
        e.language.notes,
      );
    }).toList();

    Iterable<String> roleNames = roles
        .where((role) => hero.roles.map((x) => x.roleId).contains(role.id))
        .map((x) => x.name)
        .toList();

    var vm =
        HeroViewModel(hero.displayName, hero.shortName, roleNames, abilityVms);

    emit(HeroCubitState(isLoading: false, hero: vm));
  }
}
//6251