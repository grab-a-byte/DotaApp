import 'package:dota_app/client/models/hero/hero.dart';
import 'package:dota_app/client/models/hero_ability/hero_ability.dart';
import 'package:dota_app/client/models/hero_boots/hero_boots.dart';
import 'package:dota_app/client/models/hero_role/hero_role.dart';
import 'package:dota_app/client/models/item/item.dart';
import 'package:dota_app/client/stratz_client_interface.dart';

class MockStratzClient implements IStratzClient {
  final List<HeroAbility>? heroAbilityResponse;
  final List<HeroRole>? heroRoleResponse;
  final List<Hero>? heroResponse;
  final HeroBoots? heroBootsResponse;
  final List<Item>? itemsResponse;

  MockStratzClient(
      {this.heroAbilityResponse,
      this.heroRoleResponse,
      this.heroResponse,
      this.heroBootsResponse,
      this.itemsResponse});

  @override
  Future<List<HeroAbility>> getHeroAbilities() =>
      _getValueOrError(heroAbilityResponse);

  @override
  Future<List<HeroRole>> getHeroRoles() => _getValueOrError(heroRoleResponse);

  @override
  Future<List<Hero>> getHeroes() => _getValueOrError(heroResponse);

  @override
  Future<HeroBoots> getHeroBoots(int heroId) =>
      _getValueOrError(heroBootsResponse);

  @override
  Future<List<Item>> getItems() => _getValueOrError(itemsResponse);

  Future<T> _getValueOrError<T>(T? value) =>
      value == null ? Future.error("Faked Error") : Future.value(value);
}
