import 'package:flutter/material.dart';

import '../../../view_models/hero_page/hero_stats_view_model.dart';

class HeroStatsPanel extends StatelessWidget {
  final HeroStatsViewModel? model;

  const HeroStatsPanel({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model == null
        ? Text("Something went wrong getting stats")
        : ExpansionTile(
            title: Text(
              "Hero Stat",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            children: model!.allTexts
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text(e)),
                    ))
                .toList(),
          );
  }
}
