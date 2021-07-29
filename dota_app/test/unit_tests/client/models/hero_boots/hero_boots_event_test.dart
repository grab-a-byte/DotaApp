import 'dart:convert';

import 'package:dota_app/client/models/hero_boots/hero_boots_event.dart';
import 'package:flutter_test/flutter_test.dart';

import 'hero_boots_event_json.dart';

void main() {
  test('deserializes from json correctly', () {
    final convertedJson = jsonDecode(heroBootsEventJson);

    final result = HeroBootsEvent.fromJson(convertedJson);

    expect(result.itemId, 29);
    expect(result.time, 535.8329236895654);
    expect(result.matchCount, 137111);
    expect(result.wins, 0.5415028699374959);
    expect(result.kills, 9.851273785473083);
    expect(result.deaths, 5.093252911874321);
    expect(result.assists, 8.908234933739816);
    expect(result.goldEarned, 24384.69299326823);
    expect(result.xp, 39445.83015221244);
    expect(result.activations, 20.0);
  });
}
