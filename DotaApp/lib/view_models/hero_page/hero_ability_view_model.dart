import 'package:equatable/equatable.dart';

class HeroAbilityViewModel extends Equatable {
  final List<double> _manacost;
  final List<double> _cooldown;
  final List<double> _damage;

  final String displayName;
  final String name;
  final String description;
  final List<String> attributes;
  final String lore;
  final List<String> notes;

  String get manacost => _manacost?.map((e) => e?.toString())?.join('/');
  String get cooldown => _cooldown?.map((e) => e?.toString())?.join('/');
  String get damage => _damage?.map((e) => e?.toString())?.join('/');

  String get abilityImageLocaton => 'images/abilities/${name}_vert.png';

  HeroAbilityViewModel(
      this.displayName,
      this.name,
      this.description,
      this.lore,
      this.attributes,
      this._cooldown,
      this._manacost,
      this._damage,
      this.notes);
  @override
  List<Object> get props => [displayName, name, description, attributes];
}
