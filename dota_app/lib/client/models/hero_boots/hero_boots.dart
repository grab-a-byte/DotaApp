import 'package:json_annotation/json_annotation.dart';

import 'hero_boots_event.dart';

part 'hero_boots.g.dart';

@JsonSerializable()
class HeroBoots {
  final int matchCount;
  final List<HeroBootsEvent> events;

  HeroBoots(this.matchCount, this.events);

  factory HeroBoots.fromJson(Map<String, dynamic> json) =>
      _$HeroBootsFromJson(json);
}
