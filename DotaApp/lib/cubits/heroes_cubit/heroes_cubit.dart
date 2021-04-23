import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../client/models/hero/hero.dart';
import '../../client/stratz_client_interface.dart';
import 'heroes_cubit_state.dart';

final defaultState = HeroesCubitState(isLoading: true, heroes: []);

class HeroesCubit extends Cubit<HeroesCubitState> {
  IStratzClient _client;

  HeroesCubit({@required IStratzClient client}) : super(defaultState) {
    _client = client;
  }

  void getHeroes() async {
    emit(state.copyWith(isLoading: true));
    List<Hero> heroes = await _client.getHeroes();
    emit(state.copyWith(isLoading: false, heroes: heroes));
  }

  void filterHeroes(String name) async {
    emit(state.copyWith(isLoading: true));
    List<Hero> heroes = await _client.getHeroes();
    Iterable<Hero> filteredHeroes = heroes
        .where((element) =>
            element.displayName.toLowerCase().contains(name.toLowerCase()))
        .toList();
    emit(state.copyWith(isLoading: false, heroes: filteredHeroes));
  }
}
