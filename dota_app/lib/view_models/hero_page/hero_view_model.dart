import 'package:equatable/equatable.dart';

import 'hero_ability_view_model.dart';
import 'hero_boots_view_model.dart';
import 'hero_stats_view_model.dart';

class HeroViewModel extends Equatable {
  final String? name;
  final String? _shortName;
  final List<String?> roles;
  final List<HeroAbilityViewModel> abilities;
  final HeroStatsViewModel? stats;
  final List<HeroBootsViewModel>? boots;

  String get heroImageLocation => 'images/heroes/${_shortName}_vert.png';

  HeroViewModel(this.name, this._shortName, this.roles, this.abilities,
      this.stats, this.boots);

  @override
  List<Object?> get props => [name, _shortName, roles, stats];
}
