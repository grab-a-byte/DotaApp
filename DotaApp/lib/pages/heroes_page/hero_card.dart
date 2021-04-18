import 'package:flutter/material.dart';
import '../../client/models/hero/hero.dart' as dota_hero;

class HeroCard extends StatelessWidget {
  final dota_hero.Hero _hero;
  final void Function() _onClick;

  HeroCard(this._hero, this._onClick);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClick,
      child: Card(
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
