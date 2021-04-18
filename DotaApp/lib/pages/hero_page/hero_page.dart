import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../client/stratz_client_interface.dart';
import '../../cubits/hero_cubit/hero_cubit.dart';
import '../../cubits/hero_cubit/hero_cubit_state.dart';
import '../../infrastructure/get_it.dart';
import '../../view_models/hero_page/hero_ability_view_model.dart';
import '../../view_models/hero_page/hero_view_model.dart';

class HeroPage extends StatelessWidget {
  final int _heroId;

  HeroPage(this._heroId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HeroCubit(client: getIt.get<IStratzClient>())..getHero(_heroId),
      child: BlocBuilder<HeroCubit, HeroCubitState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            var hero = state.hero;
            return _buildHeroCard(hero, context);
          }
        },
      ),
    );
  }

  _buildHeroCard(HeroViewModel model, BuildContext context) {
    return Center(
      child: Container(
        child: Card(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(model.name)]
                ..addAll(model.roles.map((x) => Text(x)))
                ..add(_buildHeroAbilitiesRow(model.abilities)),
            ),
          ),
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 10  horizontally
                5.0, // M
              )),
        ]),
      ),
    );
  }

  Row _buildHeroAbilitiesRow(List<HeroAbilityViewModel> abilities) {
    return Row(
      children: abilities
          .map((e) => Expanded(
                child: Column(
                  children: [Text(e.name), Text(e.description)]
                    ..addAll(e.attributes.map((e) => Text(e))),
                ),
              ))
          .toList(),
    );
  }
}
