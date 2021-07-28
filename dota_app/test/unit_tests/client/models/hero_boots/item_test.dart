import 'dart:convert';

import 'package:dota_app/client/models/hero_boots/item.dart';
import 'package:flutter_test/flutter_test.dart';

import 'item_json.dart';

void main() {
  test('deserializes from json correctly', () {
    var json = jsonDecode(itemJson);
    var result = Item.fromJson(json);

    expect(result.id, 29);
    expect(result.displayName, 'Boots of Speed');
    expect(result.name, 'item_boots');
    expect(result.shortName, 'boots');
  });
}
