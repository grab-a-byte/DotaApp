import 'dart:async';

import 'models/hero/hero.dart';
import 'models/hero_role/hero_role.dart';

mixin IStratzClient {
  Future<List<Hero>> getHeroes();
  Future<List<HeroRole>> getHeroRoles();
}
