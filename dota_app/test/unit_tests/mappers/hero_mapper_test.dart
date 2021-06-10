import 'package:dota_app/client/models/hero/hero.dart';
import 'package:dota_app/mappers/hero_ability_mapper.dart';
import 'package:dota_app/mappers/hero_mapper.dart';
import 'package:dota_app/mappers/hero_stat_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var hero = Hero(1, 'Some Name', "somename", [], [], null);

  var mapper = HeroMapper(HeroAbilityMapper(), HeroStatMapper());
  var viewModel = mapper.toViewModel(hero, [], []);

  test('hero name is mapped across correctly',
      () => expect(viewModel.name, 'Some Name'));
}
