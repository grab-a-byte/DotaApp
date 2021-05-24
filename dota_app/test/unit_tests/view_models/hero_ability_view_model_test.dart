import 'package:DotaApp/view_models/hero_page/hero_ability_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Equality on seperate instances succeds when identical", () {
    var instance1 = HeroAbilityViewModel(
        "test", "test", "test", "test", ["test"], [], [], [], []);
    var instance2 = HeroAbilityViewModel(
        "test", "test", "test", "test", ["test"], [], [], [], []);

    expect(instance1 == instance2, true);
  });

  test("Equality on seperate instances fails when not identical", () {
    var instance1 = HeroAbilityViewModel(
        "test", "test", "test", "test", ["not test"], [], [], [], []);
    var instance2 = HeroAbilityViewModel(
        "test", "test", "test", "test", ["test"], [], [], [], []);

    expect(instance1 != instance2, true);
  });

  test("image location generated corrctly", () {
    var vm = HeroAbilityViewModel(
        "test", "test", "test", "test", ["not test"], [], [], [], []);

    expect(vm.abilityImageLocaton, 'images/abilities/test_vert.png');
  });

  test("manacost text generated correctly", () {
    var vm = HeroAbilityViewModel("test", "test", "test", "test", ["not test"],
        [1.0, 2.0, 3.0], [3.0, 2.0, 1.0], [], []);

    expect("3.0/2.0/1.0", vm.manacost);
  });

  test("cooldown text generated correctly", () {
    var vm = HeroAbilityViewModel("test", "test", "test", "test", ["not test"],
        [1.0, 2.0, 3.0], [3.0, 2.0, 1.0], [], []);

    expect("1.0/2.0/3.0", vm.cooldown);
  });

  test("damage text generated correctly", () {
    var vm = HeroAbilityViewModel("test", "test", "test", "test", ["not test"],
        [1.0, 2.0, 3.0], [3.0, 2.0, 1.0], [42.0, 11.0, 12.3], []);

    expect("42.0/11.0/12.3", vm.damage);
  });
}
