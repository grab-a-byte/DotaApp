import 'package:DotaApp/client/models/hero.dart';
import 'package:equatable/equatable.dart';

class HeroesCubitState extends Equatable {
  final bool isLoading;
  final List<Hero> heroes;

  HeroesCubitState(this.isLoading, this.heroes);

  HeroesCubitState copyWith({bool isLoading, List<Hero> heroes}) {
    return HeroesCubitState(isLoading ?? this.isLoading, heroes ?? this.heroes);
  }

  @override
  List<Object> get props => [isLoading, heroes];
}
