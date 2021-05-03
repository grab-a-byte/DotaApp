import 'package:DotaApp/client/models/hero_ability/hero_ability.dart';
import 'package:DotaApp/client/models/hero_ability/language.dart';
import 'package:DotaApp/client/models/hero_ability/stat.dart';
import 'package:DotaApp/mappers/hero_ability_to_ability_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var language = Language(
      "Test Ability",
      ["This is a test ability"],
      "This ability was used for testing",
      ["one attribute", "two atrtributes"],
      ["a note for this ability"]);

  var stat = Stat(
    [1.0, 2.0, 3.0], // ,cooldown
    [3.0, 2.0, 1.0], //manacost
    [12.3, 45.6, 78.9], //damage
  );
  var ability = HeroAbility(1, "TestAbility", language, stat);

  var mapper = HeroAbilityMapper();

  test("maps over displayName correctly", () {
    var result = mapper.toHeroAbilityViewModel(ability);
    expect(result.displayName, "Test Ability");
  });

  test("maps over description correctly", () {
    var result = mapper.toHeroAbilityViewModel(ability);
    expect(result.description, "This is a test ability");
  });

  test("maps over lore correctly", () {
    var result = mapper.toHeroAbilityViewModel(ability);
    expect(result.lore, "This ability was used for testing");
  });

  test("maps over attributes correctly", () {
    var result = mapper.toHeroAbilityViewModel(ability);
    expect(result.attributes, ["one attribute", "two atrtributes"]);
  });

  test("maps over notes correctly", () {
    var result = mapper.toHeroAbilityViewModel(ability);
    expect(result.notes, ["a note for this ability"]);
  });
}
