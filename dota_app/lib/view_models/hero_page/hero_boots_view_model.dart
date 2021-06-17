class HeroBootsViewModel {
  final String itemName;
  final Duration time;
  final int pickRate;
  final int winRate;
  final double killDeathAssistRatio;
  final int goldPerMinute; // Need to work out calculation
  final int experiencePerMinute; // Need to work out calculation

  HeroBootsViewModel(this.itemName, this.time, this.pickRate, this.winRate,
      this.killDeathAssistRatio, this.goldPerMinute, this.experiencePerMinute);
}
