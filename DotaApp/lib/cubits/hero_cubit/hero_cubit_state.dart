import 'package:DotaApp/view_models/hero_view_model.dart';
import 'package:equatable/equatable.dart';

import '../../client/models/hero/hero.dart';

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
