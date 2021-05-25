import 'package:dota_app/client/models/hero/hero.dart';
import 'package:dota_app/client/models/hero_ability/hero_ability.dart';
import 'package:dota_app/client/models/hero_role/hero_role.dart';
import 'package:dota_app/client/stratz_client_interface.dart';

class MockStratzClient implements IStratzClient {
  List<HeroAbility>? heroAbilityResponse;
  List<HeroRole>? heroRoleResponse;
  List<Hero>? heroResponse;

  MockStratzClient(
      {this.heroAbilityResponse, this.heroRoleResponse, this.heroResponse});

  @override
  Future<List<HeroAbility>> getHeroAbilities() =>
      _getValueOrError(heroAbilityResponse);

  @override
  Future<List<HeroRole>> getHeroRoles() => _getValueOrError(heroRoleResponse);

  @override
  Future<List<Hero>> getHeroes() => _getValueOrError(heroResponse);

  Future<T> _getValueOrError<T>(T? value) =>
      value == null ? Future.error("Faked Error") : Future.value(value);
}
