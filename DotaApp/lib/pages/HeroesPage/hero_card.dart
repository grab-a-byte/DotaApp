import 'package:flutter/material.dart';
import '../../client/models/hero.dart' as dota_hero;

class HeroCard extends StatelessWidget {
  final dota_hero.Hero _hero;

  HeroCard(this._hero);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            FittedBox(
                child: Placeholder(
              fallbackHeight: 50,
              fallbackWidth: 50,
            )),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _hero.id.toString(),
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  _hero.displayName,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
