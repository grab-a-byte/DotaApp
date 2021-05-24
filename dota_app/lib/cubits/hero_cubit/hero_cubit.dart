import 'package:flutter_bloc/flutter_bloc.dart';

import '../../client/models/hero/hero.dart';
import '../../client/models/hero_ability/hero_ability.dart';
import '../../client/models/hero_role/hero_role.dart';
import '../../client/stratz_client_interface.dart';
import '../../mappers/hero_ability_to_ability_view_model.dart';
import '../../view_models/hero_page/hero_ability_view_model.dart';
import '../../view_models/hero_page/hero_view_model.dart';
import 'hero_cubit_state.dart';

HeroCubitState defaultState = HeroLoading();

class HeroCubit extends Cubit<HeroCubitState> {
  late IStratzClient _client;
  HeroAbilityMapper mapper;

  HeroCubit({required IStratzClient client, required this.mapper})
      : super(defaultState) {
    _client = client;
  }

  void getHero(int? id) async {
    emit(HeroLoading());
    List<Hero> heroes = await _client.getHeroes();
    Hero hero = heroes.firstWhere((x) => x.id == id);
    List<HeroRole> roles = await _client.getHeroRoles();

    List<HeroAbility> abilities = await _client.getHeroAbilities();

    List<HeroAbilityViewModel> abilityVms = mapper.toHeroAbilityViewModels(
        abilities
            .where((ability) => hero.abilities!
                .map((heroAbility) => heroAbility.abilityId)
                .contains(ability.id))
            .toList());

    Iterable<String?> roleNames = roles
        .where((role) => hero.roles!.map((x) => x.roleId).contains(role.id))
        .map((x) => x.name)
        .toList();

    var vm = HeroViewModel(hero.displayName, hero.shortName,
        roleNames as List<String?>, abilityVms);

    emit(HeroLoaded(vm));
  }
}
