import 'package:equatable/equatable.dart';

class HeroAbilityViewModel extends Equatable {
  final String name;
  final String description;
  final List<String> attributes;

  HeroAbilityViewModel(this.name, this.description, this.attributes);

  @override
  List<Object> get props => [name, description, attributes];
}
