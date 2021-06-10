import 'package:dota_app/client/models/hero/hero.dart';

List<Hero> getSingleHeroInList() {
  return [Hero(1, "displayName", "shortName", [], [], null)];
}

List<Hero> getMultipleHeroInList() {
  return [
    Hero(1, "displayName", "shortName", [], [], null),
    Hero(1, "bob", "bob", [], [], null),
  ];
}
