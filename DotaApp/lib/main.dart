import 'package:DotaApp/infrastructure/get_it.dart';
import 'package:DotaApp/pages/HeroesPage/HeroesPage.dart';
import 'package:flutter/material.dart';

import 'client/models/hero.dart' as DotaHero;
import 'client/stratz_client.dart';
import 'client/stratz_client_interface.dart';
import 'infrastructure/http_client.dart';

void main() {
  setupDependencyInjection();
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
          scaffoldBackgroundColor: Colors.blue.shade900),
      home: Scaffold(body: HeroesPage()),
    );
  }
}
