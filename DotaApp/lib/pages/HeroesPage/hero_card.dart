import 'package:flutter/material.dart';
import '../../client/models/hero.dart' as dota_hero;

class HeroCard extends StatelessWidget {
  final dota_hero.Hero _hero;
  final Function _onClick;

  HeroCard(this._hero, this._onClick);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: _onClick,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(
                'images/heroes/${_hero.shortName}_vert.png',
                height: 50,
                width: 50,
              ),
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
      ),
    );
  }
}
