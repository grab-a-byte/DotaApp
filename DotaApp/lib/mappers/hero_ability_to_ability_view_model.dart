import '../client/models/hero_ability/hero_ability.dart';
import '../view_models/hero_page/hero_ability_view_model.dart';

class HeroAbilityMapper {
  HeroAbilityViewModel toHeroAbilityViewModel(HeroAbility ability) =>
      HeroAbilityViewModel(
        ability.language!.displayName,
        ability.name,
        ability.language!.description!.first,
        ability.language!.lore,
        ability.language!.attributes,
        ability.stat!.cooldown,
        ability.stat!.manaCost,
        ability.stat!.damage,
        ability.language!.notes,
      );

  List<HeroAbilityViewModel> toHeroAbilityViewModels(
          List<HeroAbility> abilities) =>
      abilities
          .where((element) => element.language != null)
          .where((element) =>
              element.language!.description!.isNotEmpty &&
              element.language!.attributes!.isNotEmpty)
          .map(toHeroAbilityViewModel)
          .toList();
}
