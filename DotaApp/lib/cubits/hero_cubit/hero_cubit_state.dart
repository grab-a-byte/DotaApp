import 'package:equatable/equatable.dart';

import '../../client/models/hero/hero.dart';
import '../../view_models/hero_page/hero_view_model.dart';

class HeroCubitState extends Equatable {
  final bool isLoading;
  final HeroViewModel hero;

  HeroCubitState({this.isLoading, this.hero});

  HeroCubitState copyWith({bool isLoading, Hero hero}) {
    return HeroCubitState(
        hero: hero ?? this.hero, isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [isLoading, hero];
}
