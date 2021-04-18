import 'package:json_annotation/json_annotation.dart';

part 'hero_ability.g.dart';

@JsonSerializable()
class HeroAbility {
  final int slot;
  final int abilityId;

  HeroAbility(this.slot, this.abilityId);

  factory HeroAbility.fromJson(Map<String, dynamic> json) =>
      _$HeroAbilityFromJson(json);
  Map<String, dynamic> toJson() => _$HeroAbilityToJson(this);
}
