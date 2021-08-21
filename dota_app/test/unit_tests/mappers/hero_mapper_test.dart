import 'package:dota_app/client/models/hero/hero.dart';
import 'package:dota_app/client/models/hero_boots/hero_boots.dart';
import 'package:dota_app/client/models/hero_boots/hero_boots_event.dart';
import 'package:dota_app/client/models/item/item.dart';
import 'package:dota_app/mappers/hero_ability_mapper.dart';
import 'package:dota_app/mappers/hero_boots_mapper.dart';
import 'package:dota_app/mappers/hero_mapper.dart';
import 'package:dota_app/mappers/hero_stat_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  HeroBoots heroBoots = HeroBoots(4, [
    HeroBootsEvent(1, 1.0, 1, 1, 1, 1, 1, 1, 1, 1),
    HeroBootsEvent(2, 2.0, 2, 0.5, 2, 2, 2, 2, 2, 2)
  ]);
  List<Item> items = [
    Item(1, 'item_boots_speed', 'boots_speed', 'Boots of Speed'),
    Item(2, 'item_boots_travle', 'travel boots', 'Boots of Travel')
  ];
  var hero = Hero(1, 'Some Name', "somename", [], [], null);

  var mapper =
      HeroMapper(HeroAbilityMapper(), HeroStatMapper(), HeroBootsMapper());
  var viewModel = mapper.toViewModel(hero, [], [], heroBoots, items);

  test('hero name is mapped across correctly',
      () => expect(viewModel.name, 'Some Name'));
}
