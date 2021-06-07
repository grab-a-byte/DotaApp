import 'package:flutter/material.dart';

import '../../../view_models/hero_page/hero_ability_view_model.dart';
import '../../../widgets/nullable_text_builder.dart';

class HeroAbilityBody extends StatelessWidget {
  final HeroAbilityViewModel model;

  HeroAbilityBody(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: NullableTextBuilder(
            model.damage,
            (s) => 'DAMAGE : $s',
            nullText: 'DAMAGE : N/A',
          ),
        )
      ]
        ..addAll(model.attributes!.map((e) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(e),
            )))
        ..add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(model.description),
        ))
        ..addAll(model.notes!.map((e) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(e),
            )))
        ..add(Padding(
          padding: const EdgeInsets.all(5.0),
          child: NullableTextBuilder(
            model.lore,
            (s) => s,
            nullText: "",
          ),
        )),
    );
  }
}
