import 'dart:convert';

import 'package:dota_app/client/models/hero/hero.dart';
import 'package:flutter_test/flutter_test.dart';

import 'hero_json.dart';

void main() {
  test("Deserializes Json Correctly", () {
    Map<String, dynamic> json =
        jsonDecode(singleHeroJson) as Map<String, dynamic>;

    var result = Hero.fromJson(json);
    expect(result.id, 1);
    expect(result.name, "npc_dota_hero_antimage");
    expect(result.displayName, "Anti-Mage");
    expect(result.shortName, "antimage");
  });
}
