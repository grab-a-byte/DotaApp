import 'package:flutter/material.dart';

import '../../view_models/hero_page/hero_view_model.dart';

class HeroHeaderRow extends StatelessWidget {
  final HeroViewModel hero;

  HeroHeaderRow(this.hero);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(hero.heroImageLocation, height: 200.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                hero.name!,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Roles',
                style: TextStyle(
                    fontSize: 15, decoration: TextDecoration.underline),
              ),
            ]..addAll(
                hero.roles
                    .map((e) => Text(
                          e!,
                          style: TextStyle(
                              fontSize: 10,
                              decoration: TextDecoration.underline),
                        ))
                    .toList(),
              ),
          )
        ],
      );
}
