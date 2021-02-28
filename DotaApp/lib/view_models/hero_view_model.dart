import 'package:equatable/equatable.dart';

class HeroViewModel extends Equatable {
  final String name;
  final String shortName;
  final List<String> roles;

  HeroViewModel(this.name, this.shortName, this.roles);

  @override
  List<Object> get props => [name, shortName, roles];
}
