import 'package:dota_app/client/models/hero_boots/hero_boots.dart';
import 'package:dota_app/client/models/item/item.dart';
import 'package:dota_app/mappers/hero_boots_mapper.dart';
import 'package:dota_app/view_models/hero_page/hero_boots_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  HeroBootsMapper _mapper = HeroBootsMapper();
  HeroBoots _heroBoots = HeroBoots(1, []);
  List<Item> _items = [];

  test('maps across item name correctly', () {
    List<HeroBootsViewModel> result = _mapper.toViewModel(_heroBoots, _items);
    var heroBoots1 = result[0];
    var heroBoots2 = result[1];

    expect(heroBoots1.itemName, "Boots of Speed");
    expect(heroBoots2.itemName, "Boots of Travel");
  });
}
