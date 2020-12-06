import 'package:DotaApp/cubits/HeroesCubit/heroes_cubit.dart';
import 'package:DotaApp/cubits/HeroesCubit/heroes_cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HeroesCubit()..getHeroes(),
      child: BlocBuilder<HeroesCubit, HeroesCubitState>(
        builder: (_, state) {
          if (state.isLoading) {
            return CircularProgressIndicator();
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              padding: const EdgeInsets.all(8),
              itemCount: state.heroes.length,
              itemBuilder: (context, index) {
                var hero = state.heroes[index];
                return Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: Center(
                    child: Text(
                      hero.displayName,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
