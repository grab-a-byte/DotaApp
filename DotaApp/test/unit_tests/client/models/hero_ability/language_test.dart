import 'dart:convert';

import 'package:DotaApp/client/models/hero_ability/language.dart';
import 'package:flutter_test/flutter_test.dart';

import 'language_json.dart';

void main() {
  test("Deserializes to json correctly", () {
    var decodedJson = jsonDecode(singleLanguageJson);
    var result = Language.fromJson(decodedJson);

    expect(result.displayName, "Wraithfire Blast");
    expect(result.description.first,
        "Wraith King sears an enemy unit with spectral fire, dealing damage and stunning, then dealing damage over time and slowing the target.");
  });
}
