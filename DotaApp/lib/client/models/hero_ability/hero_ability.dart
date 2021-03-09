import 'package:DotaApp/client/models/hero_ability/language.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hero_ability.g.dart';

@JsonSerializable()
class HeroAbility {
  final int id;
  final String name;
  final Language language;

  HeroAbility(this.id, this.name, this.language);

  factory HeroAbility.fromJson(Map<String, dynamic> json) =>
      _$HeroAbilityFromJson(json);
  Map<String, dynamic> toJson() => _$HeroAbilityToJson(this);

  @override
  List<Object> get props => [id, name, language];
}
