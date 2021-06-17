import 'package:bloc/bloc.dart';

import '../../client/models/hero/hero.dart';
import '../../client/stratz_client_interface.dart';
import 'heroes_cubit_state.dart';

final defaultState = LoadingHeroes();

class HeroesCubit extends Cubit<HeroesCubitState> {
  late IStratzClient _client;

  HeroesCubit({required IStratzClient client}) : super(defaultState) {
    _client = client;
  }

  void getHeroes() async {
    emit(LoadingHeroes());
    List<Hero> heroes = await _client.getHeroes();
    emit(HeroesLoaded(_sortHeroes(heroes)));
  }

  Future filterHeroes(String name) async {
    emit(LoadingHeroes());
    List<Hero> heroes = await _client.getHeroes();
    List<Hero> filteredHeroes = heroes
        .where((element) =>
            element.displayName!.toLowerCase().contains(name.toLowerCase()))
        .toList();
    emit(HeroesLoaded(_sortHeroes(filteredHeroes)));
  }

  List<Hero> _sortHeroes(List<Hero> heroes) =>
      heroes.toList()..sort((a, b) => a.displayName!.compareTo(b.displayName!));
}
