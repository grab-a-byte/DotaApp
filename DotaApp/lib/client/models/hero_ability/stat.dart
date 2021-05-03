import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stat.g.dart';

@JsonSerializable()
class Stat extends Equatable {
  final List<double> cooldown;
  final List<double> manaCost;
  final List<double> damage;

  Stat(this.cooldown, this.manaCost, this.damage);

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
  Map<String, dynamic> toJson() => _$StatToJson(this);

  @override
  List<Object> get props => [manaCost, cooldown];
}
