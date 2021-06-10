import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stat.g.dart';

@JsonSerializable()
class Stat extends Equatable {
  final double startingArmor;
  final double startingDamageMin;
  final double startingDamageMax;
  final double attackRate;
  final double attackAnimationPoint;
  final double strengthBase;
  final double agilityBase;
  final double moveSpeed;
  final double intelligenceBase;

  Stat(
      this.startingArmor,
      this.startingDamageMin,
      this.startingDamageMax,
      this.attackRate,
      this.attackAnimationPoint,
      this.strengthBase,
      this.agilityBase,
      this.moveSpeed,
      this.intelligenceBase);

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
  Map<String, dynamic> toJson() => _$StatToJson(this);

  @override
  List<Object?> get props => [
        startingArmor,
        startingDamageMin,
        startingDamageMax,
        attackRate,
        attackAnimationPoint,
        strengthBase,
        agilityBase,
        moveSpeed,
        intelligenceBase
      ];
}
