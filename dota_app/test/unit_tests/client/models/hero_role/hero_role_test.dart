import 'dart:convert';

import 'package:dota_app/client/models/hero_role/hero_role.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var roleJson = """
  {
    "id": 0,
    "name": "Carry",
    "langKey": "roles.carry"
  }
  """;

  test("Deserializes Roles", () {
    HeroRole result = HeroRole.fromJson(jsonDecode(roleJson));

    expect(result.id, 0);
    expect(result.name, "Carry");
    expect(result.langKey, "roles.carry");
  });
}
