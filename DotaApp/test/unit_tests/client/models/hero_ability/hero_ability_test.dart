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
    expect(result.stat.cooldown, [17.0, 14.0, 11.0, 8.0]);
    expect(result.stat.manaCost, [95.0, 110.0, 125.0, 140.0]);
    expect(result.stat.damage, [70.0, 80.0, 90.0, 100.0]);
    expect(result.language.lore,
        'Ostarion calls on his damned lineage, laying waste to his opponents.');
  });
}
