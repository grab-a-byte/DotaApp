import 'package:equatable/equatable.dart';

import '../../client/models/hero/hero.dart';

class HeroesCubitState extends Equatable {
  final bool isLoading;
  final List<Hero> heroes;

  HeroesCubitState({this.isLoading, this.heroes});

  HeroesCubitState copyWith({bool isLoading, List<Hero> heroes}) {
    return HeroesCubitState(
        isLoading: isLoading ?? this.isLoading, heroes: heroes ?? this.heroes);
  }

  @override
  List<Object> get props => [isLoading, heroes];
}
