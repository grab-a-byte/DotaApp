import 'package:flutter/material.dart';

import 'client/models/hero.dart' as DotaHero;
import 'client/stratz_client.dart';
import 'client/stratz_client_interface.dart';
import 'infrastructure/http_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final IStratzClient client = StratzClient(HttpClient());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: client.getHeroes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                DotaHero.Hero hero = snapshot.data[index];
                return Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: Center(
                    child: Text(
                      hero.displayName,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}
