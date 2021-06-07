class HeroStatsViewModel {
  final int
      health; // All heroes have base hit points of 200 plus 20 for each point of Strength.
  final double armour;
  final double moveSpeed;
  final double attackDamageMin;
  final double attackDamageMax;
  final double attackSpeed; // AttackRate ÷ (1 + (Agility ÷ 100))
  final double attackPoint;
  final double spellDamage;
  final double
      manaPool; // All heroes have a base mana of 75, plus 12 per each point of Intelligence.

  HeroStatsViewModel(
      {required this.health,
      required this.armour,
      required this.moveSpeed,
      required this.attackDamageMin,
      required this.attackDamageMax,
      required this.attackSpeed,
      required this.attackPoint,
      required this.spellDamage,
      required this.manaPool});
}
