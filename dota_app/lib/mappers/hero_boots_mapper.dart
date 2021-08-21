import '../client/models/hero_boots/hero_boots.dart';
import '../client/models/item/item.dart';
import '../view_models/hero_page/hero_boots_view_model.dart';

class HeroBootsMapper {
  List<HeroBootsViewModel> toViewModel(HeroBoots heroBoots, List<Item> items) {
    //Some values have been left as -1 as placeholders to check screen. Will be figured out later.

    return heroBoots.events.map((e) {
      var item = items.firstWhere((element) => element.id == e.itemId);
      var pickRate = (e.matchCount / heroBoots.matchCount) * 100;
      var winRate = (e.wins * 100);
      return HeroBootsViewModel(
        item.displayName,
        Duration(seconds: e.time.floor()),
        pickRate.ceil(),
        winRate.ceil(),
        (e.kills + e.assists) / e.deaths,
        -1, // goldPerMinute NEED TO FIGURE OUT HOW THIS IS CALCULATED
        -1, // experiencePerMinute NEED TO FIGURE OUT HOW THIS IS CALCULATED
      );
    }).toList();
  }
}
