import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'hero_ability.dart';
import 'hero_role.dart';

part 'hero.g.dart';

@JsonSerializable()
class Hero extends Equatable {
  Hero(this.id, this.name, this.displayName, this.shortName, this.roles,
      this.abilities);

  final int? id;

  final String? name;

  final String? displayName;

  final String? shortName;

  final List<HeroRole>? roles;

  final List<HeroAbility>? abilities;

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);
  Map<String, dynamic> toJson() => _$HeroToJson(this);

  @override
  List<Object?> get props =>
      [id, name, displayName, shortName, roles, abilities];
}
