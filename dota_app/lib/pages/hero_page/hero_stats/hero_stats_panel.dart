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
            title: Text("Something Something"),
            children: [
              //TODO map all texts
              Container(
                height: 50,
                child: Placeholder(),
              )
            ],
          );
  }
}
