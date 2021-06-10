import '../client/models/hero/stat.dart';
import '../view_models/hero_page/hero_stats_view_model.dart';

class HeroStatMapper {
  HeroStatsViewModel? toViewModel(Stat? stat) {
    if (stat == null) return null;

    return HeroStatsViewModel(
        health: 200 + (stat.strengthBase.floor() * 20),
        armour: stat.startingArmor,
        moveSpeed: stat.moveSpeed,
        attackDamageMin: stat.startingDamageMin,
        attackDamageMax: stat.startingDamageMax,
        attackSpeed: stat.attackRate + (1 + (stat.agilityBase / 100)),
        attackPoint: stat.attackAnimationPoint,
        manaPool: 75 + (stat.intelligenceBase * 12));
  }
}
