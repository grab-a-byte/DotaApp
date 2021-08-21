import '../../client/models/hero_role/hero_role.dart';
import '../client/models/hero/hero.dart';
import '../client/models/hero_ability/hero_ability.dart';
import '../client/models/hero_boots/hero_boots.dart';
import '../client/models/item/item.dart';
import '../view_models/hero_page/hero_ability_view_model.dart';
import '../view_models/hero_page/hero_boots_view_model.dart';
import '../view_models/hero_page/hero_stats_view_model.dart';
import '../view_models/hero_page/hero_view_model.dart';
import 'hero_ability_mapper.dart';
import 'hero_boots_mapper.dart';
import 'hero_stat_mapper.dart';

class HeroMapper {
  final HeroAbilityMapper _heroAbilityMapper;
  final HeroStatMapper _heroStatMapper;
  final HeroBootsMapper _heroBootsMapper;

  HeroMapper(
      this._heroAbilityMapper, this._heroStatMapper, this._heroBootsMapper);

  HeroViewModel toViewModel(Hero hero, List<HeroAbility> abilities,
      List<HeroRole> roles, HeroBoots boots, List<Item> items) {
    List<HeroAbilityViewModel> abilityVms =
        _heroAbilityMapper.toHeroAbilityViewModels(abilities);

    var roleNames = roles.map((e) => e.name).toList();

    HeroStatsViewModel? stats = _heroStatMapper.toViewModel(hero.stat);

    List<HeroBootsViewModel> heroBoots =
        _heroBootsMapper.toViewModel(boots, items);

    return HeroViewModel(hero.displayName, hero.shortName, roleNames,
        abilityVms, stats, heroBoots);
  }
}
