import 'package:DotaApp/view_models/hero_ability_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Equality on seperate instances succeds when identical", () {
    var instance1 = HeroAbilityViewModel("test", "test", ["test"]);
    var instance2 = HeroAbilityViewModel("test", "test", ["test"]);

    expect(instance1 == instance2, true);
  });

  test("Equality on seperate instances fails when not identical", () {
    var instance1 = HeroAbilityViewModel("test", "test", ["not test"]);
    var instance2 = HeroAbilityViewModel("test", "test", ["test"]);

    expect(instance1 != instance2, true);
  });
}
