import 'package:equatable/equatable.dart';

abstract class NavigationState {}

class NavigateToHeroPage extends Equatable implements NavigationState {
  final int heroId;

  NavigateToHeroPage(this.heroId);

  @override
  List<Object> get props => [heroId];
}

class NavigateToHomePage extends Equatable implements NavigationState {
  @override
  List<Object> get props => [];
}
