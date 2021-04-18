import 'package:equatable/equatable.dart';

import 'hero_ability_view_model.dart';

class HeroViewModel extends Equatable {
  final String name;
  final String shortName;
  final List<String> roles;
  final List<HeroAbilityViewModel> abilities;

  HeroViewModel(this.name, this.shortName, this.roles, this.abilities);

  @override
  List<Object> get props => [name, shortName, roles];
}
