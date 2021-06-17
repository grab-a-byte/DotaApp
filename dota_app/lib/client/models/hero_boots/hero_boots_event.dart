import 'package:json_annotation/json_annotation.dart';

part 'hero_boots_event.g.dart';

@JsonSerializable()
class HeroBootsEvent {
  final int itemId;
  final double time;
  final int matchCount;
  final double wins;
  final double kills;
  final double assists;
  final double deaths;
  final double goldEarned;
  final double xp;
  final double activations;

  HeroBootsEvent(this.itemId, this.time, this.matchCount, this.wins, this.kills,
      this.assists, this.deaths, this.goldEarned, this.xp, this.activations);

  factory HeroBootsEvent.fromJson(Map<String, dynamic> json) =>
      _$HeroBootsEventFromJson(json);
}
