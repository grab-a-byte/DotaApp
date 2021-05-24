import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hero_role.g.dart';

@JsonSerializable()
class HeroRole extends Equatable {
  final int? id;
  final String? name;
  final String? langKey;

  HeroRole(this.id, this.name, this.langKey);

  factory HeroRole.fromJson(Map<String, dynamic> json) =>
      _$HeroRoleFromJson(json);
  Map<String, dynamic> toJson() => _$HeroRoleToJson(this);

  @override
  List<Object?> get props => [id, name, langKey];
}
