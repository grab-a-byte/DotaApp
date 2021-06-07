import 'package:flutter/material.dart';

import '../../../view_models/hero_page/hero_ability_view_model.dart';
import 'hero_ability_body.dart';
import 'hero_ability_header.dart';

class HeroExpansionPanel extends StatefulWidget {
  final List<HeroAbilityViewModel> model;

  HeroExpansionPanel(this.model);

  @override
  State<StatefulWidget> createState() => HeroExpansionPanelState(model);
}

class HeroExpansionPanelState extends State<HeroExpansionPanel> {
  late List<HeroRows> _rows;

  HeroExpansionPanelState(List<HeroAbilityViewModel> models) {
    _rows = models
        .map((e) => HeroRows(HeroAbilityHeader(e), HeroAbilityBody(e)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ability Details",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          ExpansionPanelList(
            expansionCallback: (index, isExpanded) {
              setState(() {
                _rows[index].isExpanded = !isExpanded;
              });
            },
            children: _rows.map((e) => e.panel).toList(),
          ),
        ],
      ),
    );
  }
}

class HeroRows {
  bool isExpanded = false;
  final HeroAbilityHeader header;
  final Widget body;
  HeroRows(this.header, this.body);

  ExpansionPanel get panel => ExpansionPanel(
      headerBuilder: (_, __) => header, body: body, isExpanded: isExpanded);
}
