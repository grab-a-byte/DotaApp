import 'package:equatable/equatable.dart';

class HeroAbilityViewModel extends Equatable {
  final String displayName;
  final String name;
  final String description;
  final List<String> attributes;

  String get abilityImageLocaton => 'images/abilities/${name}_vert.png';

  HeroAbilityViewModel(
      this.displayName, this.name, this.description, this.attributes);

  @override
  List<Object> get props => [displayName, name, description, attributes];
}
