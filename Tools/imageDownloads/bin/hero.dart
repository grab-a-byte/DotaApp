import 'package:json_annotation/json_annotation.dart';

part 'hero.g.dart';

@JsonSerializable()
class Hero {
  Hero(this.id, this.name, this.displayName, this.shortName);

  final int id;

  final String name;

  final String displayName;

  final String shortName;

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);
  Map<String, dynamic> toJson() => _$HeroToJson(this);
}
