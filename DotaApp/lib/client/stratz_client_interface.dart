import 'dart:async';

import 'models/hero.dart';

mixin IStratzClient {
  Future<List<Hero>> getHeroes();
}
