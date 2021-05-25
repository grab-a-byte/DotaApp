import 'package:dota_app/client/models/hero/hero.dart';

List<Hero> getSingleHeroInList() {
  return [Hero(1, "name", "displayName", "shortName", [], [])];
}

List<Hero> getMultipleHeroInList() {
  return [
    Hero(1, "name", "displayName", "shortName", [], []),
    Hero(1, "bob", "bob", "bob", [], []),
  ];
}
