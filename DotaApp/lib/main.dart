import 'package:flutter/material.dart';

import 'infrastructure/get_it.dart';
import 'pages/HeroesPage/heroes_page.dart';

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
