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
  List<Object?> get props => [
        health,
        armour,
        moveSpeed,
        attackDamageMin,
        attackDamageMax,
        attackSpeed,
        attackPoint,
        manaPool
      ];
}
