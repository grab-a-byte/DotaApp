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
            child: ListView(
              children: [_heroHeader(context, model)]
                ..addAll(_buildHeroAbilitiesRow(model.abilities)),
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

  Row _heroHeader(BuildContext context, HeroViewModel hero) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(hero.heroImageLocation, height: 200.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              hero.name,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Roles',
              style:
                  TextStyle(fontSize: 15, decoration: TextDecoration.underline),
            ),
          ]..addAll(
              hero.roles
                  .map((e) => Text(
                        e,
                        style: TextStyle(
                            fontSize: 10, decoration: TextDecoration.underline),
                      ))
                  .toList(),
            ),
        )
      ],
    );
  }

  List<Widget> _buildHeroAbilitiesRow(List<HeroAbilityViewModel> abilities) {
    return abilities
        .expand((e) => [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      e.abilityImageLocaton,
                      height: 60,
                    ),
                  ),
                  Expanded(child: Text(e.displayName)),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: e.attributes
                            .map((e) => Text(
                                  e,
                                  style: TextStyle(fontSize: 10),
                                ))
                            .toList(),
                      )),
                ],
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
            ])
        .toList();
  }
}
