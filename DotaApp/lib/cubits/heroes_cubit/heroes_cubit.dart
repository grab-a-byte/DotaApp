import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../client/models/hero/hero.dart';
import '../../client/stratz_client_interface.dart';
import 'heroes_cubit_state.dart';

final defaultState = LoadingHeroes();

class HeroesCubit extends Cubit<HeroesCubitState> {
  IStratzClient _client;

  HeroesCubit({@required IStratzClient client}) : super(defaultState) {
    _client = client;
  }

  void getHeroes() async {
    emit(LoadingHeroes());
    List<Hero> heroes = await _client.getHeroes();
    emit(HeroesLoaded(heroes));
  }

  void filterHeroes(String name) async {
    emit(LoadingHeroes());
    List<Hero> heroes = await _client.getHeroes();
    Iterable<Hero> filteredHeroes = heroes
        .where((element) =>
            element.displayName.toLowerCase().contains(name.toLowerCase()))
        .toList();
    emit(HeroesLoaded(filteredHeroes));
  }
}
