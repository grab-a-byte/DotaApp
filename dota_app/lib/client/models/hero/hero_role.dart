import 'package:json_annotation/json_annotation.dart';

part 'hero_role.g.dart';

@JsonSerializable()
class HeroRole {
  final int? roleId;
  final int? level;

  HeroRole(this.roleId, this.level);

  factory HeroRole.fromJson(Map<String, dynamic> json) =>
      _$HeroRoleFromJson(json);
  Map<String, dynamic> toJson() => _$HeroRoleToJson(this);
}
