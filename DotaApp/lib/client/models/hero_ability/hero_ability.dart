import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'language.dart';
import 'stat.dart';

part 'hero_ability.g.dart';

@JsonSerializable()
class HeroAbility extends Equatable {
  final int? id;
  final String? name;
  final Language? language;
  final Stat? stat;

  HeroAbility(this.id, this.name, this.language, this.stat);

  factory HeroAbility.fromJson(Map<String, dynamic> json) =>
      _$HeroAbilityFromJson(json);
  Map<String, dynamic> toJson() => _$HeroAbilityToJson(this);

  @override
  List<Object?> get props => [id, name, language];
}
