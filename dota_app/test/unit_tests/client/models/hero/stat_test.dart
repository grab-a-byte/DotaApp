import 'dart:convert';

import 'package:dota_app/client/models/hero/stat.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stat_json.dart';

void main() {
  test('deserializes from json correctly', () {
    var result = Stat.fromJson(jsonDecode(statJson));

    expect(result.startingArmor, 2.36);
    expect(result.startingDamageMin, 29.0);
    expect(result.startingDamageMax, 33.0);
    expect(result.attackRate, 1.4);
    expect(result.attackAnimationPoint, 0.3);
    expect(result.strengthBase, 23.0);
    expect(result.agilityBase, 24.0);
    expect(result.moveSpeed, 310.0);
    expect(result.intelligenceBase, 12.0);
  });
}
