import 'package:equatable/equatable.dart';

class HeroStatsViewModel extends Equatable {
  final int health;
  final double armour;
  final double moveSpeed;
  final double attackDamageMin;
  final double attackDamageMax;
  final double attackSpeed;
  final double attackPoint;
  final double manaPool;

  HeroStatsViewModel(
      {required this.health,
      required this.armour,
      required this.moveSpeed,
      required this.attackDamageMin,
      required this.attackDamageMax,
      required this.attackSpeed,
      required this.attackPoint,
      required this.manaPool});

  @override
  List<Object> get props => [
        health,
        armour,
        moveSpeed,
        attackDamageMin,
        attackDamageMax,
        attackSpeed,
        attackPoint,
        manaPool
      ];

  String get healthText => 'Health: $health';

  String get armourText => 'Armour: ${armour.toStringAsFixed(2)}';

  String get moveSpeedText => 'Move Speed: ${moveSpeed.toStringAsFixed(2)}';

  String get attackDamageText =>
      'Attack Damage: ${attackDamageMin.toStringAsFixed(2)} - ${attackDamageMax.toStringAsFixed(2)}';

  String get attackSpeedText =>
      'Attack Speed: ${attackSpeed.toStringAsFixed(2)}';

  String get attackPointText =>
      'Attack Point: ${attackPoint.toStringAsFixed(2)}';

  String get manaPoolText => 'Mana: ${manaPool.toStringAsFixed(2)}';
}
