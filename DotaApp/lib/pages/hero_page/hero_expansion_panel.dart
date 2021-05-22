import 'package:flutter/material.dart';

import '../../view_models/hero_page/hero_ability_view_model.dart';
import 'hero_ability_body.dart';
import 'hero_ability_header.dart';

class HeroExpansionPanel extends StatefulWidget {
  final List<HeroAbilityViewModel> model;

  HeroExpansionPanel(this.model);

  @override
  State<StatefulWidget> createState() => HeroExpansionPanelState(model);
}

class HeroExpansionPanelState extends State<StatefulWidget> {
  late List<HeroRows> _rows;

  HeroExpansionPanelState(List<HeroAbilityViewModel> models) {
    _rows = models
        .map((e) => HeroRows(HeroAbilityHeader(e), HeroAbilityBody(e)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() {
          _rows[index].isExpanded = !isExpanded;
        });
      },
      children: _rows.map((e) => e.panel).toList(),
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
