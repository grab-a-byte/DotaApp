import 'package:equatable/equatable.dart';

import '../../client/models/hero/hero.dart';

abstract class HeroesCubitState {}

class LoadingHeroes extends Equatable implements HeroesCubitState {
  @override
  List<Object> get props => ["LoadingHeroes"];
}

class HeroesLoaded extends Equatable implements HeroesCubitState {
  final List<Hero> heroes;

  HeroesLoaded(this.heroes);

  @override
  List<Object> get props => [heroes];
}
