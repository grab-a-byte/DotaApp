import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  final int id;
  final String name;
  final String shortName;
  final String displayName;

  Item(this.id, this.name, this.shortName, this.displayName);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  List<Object?> get props => [id, name, shortName, displayName];
}
