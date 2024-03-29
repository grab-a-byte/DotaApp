import 'dart:async';

import 'package:dota_app/client/models/item/item.dart';

import 'models/hero/hero.dart';
import 'models/hero_ability/hero_ability.dart';
import 'models/hero_boots/hero_boots.dart';
import 'models/hero_role/hero_role.dart';

mixin IStratzClient {
  Future<List<Hero>> getHeroes();
  Future<List<HeroRole>> getHeroRoles();
  Future<List<HeroAbility>> getHeroAbilities();
  Future<HeroBoots> getHeroBoots(int heroId);
  Future<List<Item>> getItems();
}
