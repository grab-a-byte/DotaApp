import 'package:equatable/equatable.dart';

import 'hero_ability_view_model.dart';

class HeroViewModel extends Equatable {
  final String? name;
  final String? _shortName;
  final List<String?> roles;
  final List<HeroAbilityViewModel> abilities;

  String get heroImageLocation => 'images/heroes/${_shortName}_vert.png';

  HeroViewModel(this.name, this._shortName, this.roles, this.abilities);

  @override
  List<Object?> get props => [name, _shortName, roles];
}
