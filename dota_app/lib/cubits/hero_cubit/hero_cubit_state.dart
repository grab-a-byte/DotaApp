import 'package:equatable/equatable.dart';

import '../../view_models/hero_page/hero_view_model.dart';

abstract class HeroCubitState {}

class HeroLoading extends Equatable implements HeroCubitState {
  @override
  List<Object> get props => ["HeroLoading"];
}

class HeroLoaded extends Equatable implements HeroCubitState {
  final HeroViewModel hero;

  HeroLoaded(this.hero);

  @override
  List<Object> get props => [hero];
}
