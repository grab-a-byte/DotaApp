import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/HeroesCubit/heroes_cubit.dart';
import '../../cubits/HeroesCubit/heroes_cubit_state.dart';
import '../../cubits/NavigationCubit/navigation_cubit.dart';
import '../../cubits/NavigationCubit/navigation_state.dart';
import 'hero_card.dart';

class HeroesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HeroesCubit()..getHeroes(),
      child: BlocBuilder<HeroesCubit, HeroesCubitState>(
        builder: (context, state) {
          if (state.isLoading) {
            return CircularProgressIndicator();
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: RaisedButton(
                      onPressed: () => context.read<HeroesCubit>()..getHeroes(),
                      child: const Text('Enabled Button',
                          style: TextStyle(fontSize: 20))),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    padding: const EdgeInsets.all(8),
                    itemCount: state.heroes.length,
                    itemBuilder: (context, index) {
                      var hero = state.heroes[index];
                      return BlocBuilder<NavigationCubit, NavigationState>(
                          builder: (context, state) => HeroCard(
                              hero,
                              () => context
                                  .read<NavigationCubit>()
                                  .navigateToHeroesPage(hero.id)));
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
