import 'package:flutter_bloc/flutter_bloc.dart';

import '../../client/models/hero/hero.dart';
import '../../client/models/hero_role/hero_role.dart';
import '../../client/stratz_client_interface.dart';
import '../../infrastructure/get_it.dart';
import '../../view_models/hero_view_model.dart';
import 'hero_cubit_state.dart';

HeroCubitState defaultState = HeroCubitState(isLoading: false, hero: null);

class HeroCubit extends Cubit<HeroCubitState> {
  IStratzClient _client;

  HeroCubit({IStratzClient client}) : super(defaultState) {
    _client = client ?? getIt.get<IStratzClient>();
  }

  void getHero(int id) async {
    emit(state.copyWith(isLoading: true));
    List<Hero> heroes = await _client.getHeroes();
    Hero hero = heroes.firstWhere((x) => x.id == id);
    List<HeroRole> roles = await _client.getHeroRoles();
    Iterable<String> roleNames = roles
        .where((role) => hero.roles.map((x) => x.roleId).contains(role.id))
        .map((x) => x.name)
        .toList();

    var vm = HeroViewModel(hero.displayName, hero.shortName, roleNames);

    emit(HeroCubitState(isLoading: false, hero: vm));
  }
}
