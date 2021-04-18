import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class Language extends Equatable {
  final String displayName;
  final List<String> description;
  final List<String> attributes;

  Language(this.displayName, this.description, this.attributes);

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  @override
  List<Object> get props => [displayName, description];
}
