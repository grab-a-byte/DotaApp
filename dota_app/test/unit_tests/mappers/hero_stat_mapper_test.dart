import 'package:dota_app/client/models/hero/stat.dart';
import 'package:dota_app/mappers/hero_stat_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var mapper = HeroStatMapper();

  var stat = Stat(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0);

  var result = mapper.toViewModel(stat);

  test('Starting Armour Mapped correctlly', () => expect(result!.armour, 1.0));

  test('Starting Min Damage Mapped correctly',
      () => expect(result!.attackDamageMin, 2.0));

  test('Starting Max Damage Mapped correctly',
      () => expect(result!.attackDamageMax, 3.0));

  test('Attack Point Mapped correctly', () => expect(result!.attackPoint, 5.0));
  test('Move Speed Mapped correctly', () => expect(result!.moveSpeed, 8.0));

  test('Health Mapped correctly', () => expect(result!.health, 320.0));

  test(
      'Attack Speed Mapped correctly', () => expect(result!.attackSpeed, 5.07));
}
