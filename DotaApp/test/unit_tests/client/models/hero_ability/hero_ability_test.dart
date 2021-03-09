import 'dart:convert';

import 'package:DotaApp/client/models/hero_ability/hero_ability.dart';
import 'package:flutter_test/flutter_test.dart';

import 'hero_ability_json.dart';

void main() {
  test("deserializes correctly from Json", () {
    var decodedJson = jsonDecode(singleAbilityJson);
    HeroAbility result = HeroAbility.fromJson(decodedJson);

    expect(result.id, 5086);
    expect(result.name, "skeleton_king_hellfire_blast");
    expect(result.language.displayName, "Wraithfire Blast");
  });
}
