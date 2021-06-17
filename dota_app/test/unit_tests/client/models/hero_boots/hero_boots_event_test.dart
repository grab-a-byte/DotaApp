import 'dart:convert';

import 'package:dota_app/client/models/hero_boots/hero_boots_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deserializes from json correctly', () {
    const json = '''
    {
        "itemId": 29,
        "instance": 0,
        "time": 535.8329236895654,
        "matchCount": 137111,
        "wins": 0.5415028699374959,
        "kills": 9.851273785473083,
        "deaths": 5.093252911874321,
        "assists": 8.908234933739816,
        "goldEarned": 24384.69299326823,
        "xp": 39445.83015221244,
        "activations": 20.0,
        "activationsTime": 2101.3176915054228
      }
    ''';

    final convertedJson = jsonDecode(json);

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
