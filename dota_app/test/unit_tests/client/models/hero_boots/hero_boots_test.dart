import 'dart:convert';

import 'package:dota_app/client/models/hero_boots/hero_boots.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Serializes from Json correctly', () {
    const json = '''
    {
      "heroId": 1,
      "week": 2684,
      "bracketBasic": 255,
      "position": 255,
      "events": [],
      "matchCount": 137471
    }
    ''';

    var convertedJson = jsonDecode(json);

    var result = HeroBoots.fromJson(convertedJson);

    expect(result.matchCount, 137471);
    expect(result.events.length, 0);
  });
}
