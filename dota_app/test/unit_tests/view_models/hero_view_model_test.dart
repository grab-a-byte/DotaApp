import 'package:dota_app/view_models/hero_page/hero_ability_view_model.dart';
import 'package:dota_app/view_models/hero_page/hero_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Equality on seperate instances succeds when identical", () {
    var instance1 = HeroViewModel(
        "Test",
        "test",
        ["test"],
        [
          HeroAbilityViewModel(
              "test", "test", "test", "test", ["test"], [], [], [], [])
        ],
        null);
    var instance2 = HeroViewModel(
        "Test",
        "test",
        ["test"],
        [
          HeroAbilityViewModel(
              "test", "test", "test", "test", ["test"], [], [], [], [])
        ],
        null);

    expect(instance1 == instance2, true);
  });

  test("Equality on seperate instances fails when not identical", () {
    var instance1 = HeroViewModel("Test", "test", ["not test"], [], null);
    var instance2 = HeroViewModel("Test", "test", ["test"], [], null);

    expect(instance1 != instance2, true);
  });

  test("image location generated corrctly", () {
    var vm = HeroViewModel("Test", "test", ["not test"], [], null);

    expect(vm.heroImageLocation, 'images/heroes/test_vert.png');
  });
}
