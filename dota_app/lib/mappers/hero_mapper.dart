import '../../client/models/hero_role/hero_role.dart';
import '../client/models/hero/hero.dart';
import '../client/models/hero_ability/hero_ability.dart';
import '../view_models/hero_page/hero_ability_view_model.dart';
import '../view_models/hero_page/hero_stats_view_model.dart';
import '../view_models/hero_page/hero_view_model.dart';
import 'hero_ability_mapper.dart';
import 'hero_stat_mapper.dart';

class HeroMapper {
  final HeroAbilityMapper _heroAbilityMapper;
  final HeroStatMapper _heroStatMapper;

  HeroMapper(this._heroAbilityMapper, this._heroStatMapper);

  HeroViewModel toViewModel(
      Hero hero, List<HeroAbility> abilities, List<HeroRole> roles) {
    List<HeroAbilityViewModel> abilityVms =
        _heroAbilityMapper.toHeroAbilityViewModels(abilities);

    var roleNames = roles.map((e) => e.name).toList();

    HeroStatsViewModel? stats = _heroStatMapper.toViewModel(hero.stat);

    return HeroViewModel(
        hero.displayName, hero.shortName, roleNames, abilityVms, stats);
  }
}
