import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_state.dart';

final _defaultState = NavigateToHomePage();

class NavigationCubit extends Cubit<NavigationState> {
  final Queue<NavigationState> _states = Queue();

  NavigationCubit() : super(_defaultState);

  void navigateToHeroesPage(int? heroId) {
    _pushAndEmit(NavigateToHeroPage(heroId));
  }

  void navigateToHomePage() {
    _pushAndEmit(NavigateToHomePage());
  }

  void goBack() {
    _states.removeLast();
    emit(_states.last);
  }

  void _pushAndEmit(NavigationState state) {
    _states.add(state);
    emit(state);
  }
}
