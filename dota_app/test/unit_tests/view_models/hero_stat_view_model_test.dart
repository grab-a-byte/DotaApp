import 'package:dota_app/view_models/hero_page/hero_stats_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var vm = HeroStatsViewModel(
      health: 1,
      armour: 2.344,
      moveSpeed: 3.456,
      attackDamageMin: 4.567,
      attackDamageMax: 5.678,
      attackSpeed: 6.789,
      attackPoint: 7.89,
      manaPool: 8.0);

  test("health text genrated correctly",
      () => expect(vm.healthText, "Health: 1"));

  test("armour text genrated correctly",
      () => expect(vm.armourText, "Armour: 2.34"));

  test("moveSpeed text genrated correctly",
      () => expect(vm.moveSpeedText, "Move Speed: 3.46"));

  test("attackDamage text genrated correctly",
      () => expect(vm.attackDamageText, "Attack Damage: 4.57 - 5.68"));
  test("attackSpeed text genrated correctly",
      () => expect(vm.attackSpeedText, "Attack Speed: 6.79"));
  test("attackPoint text genrated correctly",
      () => expect(vm.attackPointText, "Attack Point: 7.89"));

  test("manaPool text genrated correctly",
      () => expect(vm.manaPoolText, "Mana: 8.00"));
}
