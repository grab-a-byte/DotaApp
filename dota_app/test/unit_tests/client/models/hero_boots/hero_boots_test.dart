import 'dart:convert';

import 'package:dota_app/client/models/hero_boots/hero_boots.dart';
import 'package:flutter_test/flutter_test.dart';

import 'hero_boots_json.dart';

void main() {
  test('Serializes from Json correctly', () {
    var convertedJson = jsonDecode(heroBootsJson);

    var result = HeroBoots.fromJson(convertedJson);

    expect(result.matchCount, 137471);
    expect(result.events.length, 1);
  });
}
