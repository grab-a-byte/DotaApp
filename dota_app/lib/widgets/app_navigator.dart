import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/navigation_cubit/navigation_cubit.dart';
import '../cubits/navigation_cubit/navigation_state.dart';
import '../pages/hero_page/hero_page.dart';
import '../pages/heroes_page/heroes_page.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            context.read<NavigationCubit>().goBack();
            return Future.value(false);
          },
          child: Navigator(
            pages: [
              MaterialPage(child: HeroesPage()),
              if (state is NavigateToHeroPage)
                MaterialPage(child: HeroPage(state.heroId)),
            ],
            onPopPage: (route, result) {
              BlocProvider.of<NavigationCubit>(context).navigateToHomePage();
              return route.didPop(result);
            },
          ),
        );
      },
    );
  }
}
