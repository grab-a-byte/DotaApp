import 'package:dota_app/client/models/hero_boots/hero_boots.dart';
import 'package:dota_app/client/models/hero_boots/hero_boots_event.dart';
import 'package:dota_app/client/models/item/item.dart';
import 'package:dota_app/mappers/hero_boots_mapper.dart';
import 'package:dota_app/view_models/hero_page/hero_boots_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  HeroBootsMapper _mapper = HeroBootsMapper();
  HeroBoots _heroBoots = HeroBoots(4, [
    HeroBootsEvent(1, 1.0, 1, 1, 1, 1, 1, 1, 1, 1),
    HeroBootsEvent(2, 2.0, 2, 0.5, 2, 2, 2, 2, 2, 2)
  ]);
  List<Item> _items = [
    Item(1, 'item_boots_speed', 'boots_speed', 'Boots of Speed'),
    Item(2, 'item_boots_travle', 'travel boots', 'Boots of Travel')
  ];

  List<HeroBootsViewModel> result = _mapper.toViewModel(_heroBoots, _items);
  var heroBoots1 = result[0];
  var heroBoots2 = result[1];

  test('maps across item name correctly', () {
    expect(heroBoots1.itemName, "Boots of Speed");
    expect(heroBoots2.itemName, "Boots of Travel");
  });

  test('maps across time correctly correctly', () {
    expect(heroBoots1.time, Duration(seconds: 1));
    expect(heroBoots2.time, Duration(seconds: 2));
  });

  test('maps across KDA ratio correctly correctly', () {
    expect(heroBoots1.killDeathAssistRatio, 2.0);
    expect(heroBoots2.killDeathAssistRatio, 2.0);
  });

  test('maps across win rate ratio correctly correctly', () {
    expect(heroBoots1.winRate, 100);
    expect(heroBoots2.winRate, 50);
  });

  test('maps across pick rate ratio correctly correctly', () {
    expect(heroBoots1.pickRate, 25);
    expect(heroBoots2.pickRate, 50);
  });
}
