import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'hero_ability.dart';
import 'hero_role.dart';
import 'stat.dart';

part 'hero.g.dart';

@JsonSerializable()
class Hero extends Equatable {
  Hero(this.id, this.displayName, this.shortName, this.roles, this.abilities,
      this.stat);

  final int? id;

  final String? displayName;

  final String? shortName;

  final List<HeroRole>? roles;

  final List<HeroAbility>? abilities;

  final Stat? stat;

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);
  Map<String, dynamic> toJson() => _$HeroToJson(this);

  @override
  List<Object?> get props => [id, displayName, shortName, roles, abilities];
}
