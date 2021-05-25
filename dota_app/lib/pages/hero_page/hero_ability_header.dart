import 'package:flutter/material.dart';

import '../../view_models/hero_page/hero_ability_view_model.dart';
import '../../widgets/nullable_text_builder.dart';

class HeroAbilityHeader extends StatelessWidget {
  final HeroAbilityViewModel model;

  HeroAbilityHeader(this.model);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              model.abilityImageLocaton,
              height: 60,
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.displayName!,
                      style: TextStyle(fontSize: 15),
                    ),
                    NullableTextBuilder(
                      model.manacost,
                      (e) => 'ManaCost $e',
                      style: TextStyle(fontSize: 12),
                      nullText: 'N/A',
                    ),
                    NullableTextBuilder(
                      model.cooldown,
                      (e) => 'Cooldown $e',
                      style: TextStyle(fontSize: 12),
                      nullText: 'N/A',
                    ),
                  ])),
        ],
      );
}
