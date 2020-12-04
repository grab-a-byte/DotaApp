import 'package:bloc/bloc.dart';

import '../../client/models/hero.dart';
import '../../client/stratz_client_interface.dart';
import 'heroes_cubit_state.dart';

final defaultState = HeroesCubitState(true, []);

class HeroesCubit extends Cubit<HeroesCubitState> {
  IStratzClient _client;

  HeroesCubit(IStratzClient client) : super(defaultState) {
    _client = client;
  }

  void getHeroes() async {
    emit(state.copyWith(isLoading: true));
    List<Hero> heroes = await _client.getHeroes();
    emit(state.copyWith(isLoading: false, heroes: heroes));
  }
}
