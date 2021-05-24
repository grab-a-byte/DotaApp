import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/navigation_cubit/navigation_cubit.dart';
import 'cubits/navigation_cubit/navigation_state.dart';
import 'infrastructure/get_it.dart';
import 'pages/hero_page/hero_page.dart';
import 'pages/heroes_page/heroes_page.dart';

void main() {
  setupDependencyInjection();
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final backgroundColors = [
    Color.fromRGBO(20, 35, 55, 1.0),
    Color.fromRGBO(13, 62, 130, 1.0),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.blueAccent.shade700),
        home: BlocProvider(
          create: (_) => NavigationCubit()..navigateToHomePage(),
          child: Scaffold(
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: backgroundColors,
                      begin: const FractionalOffset(1.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: BlocBuilder<NavigationCubit, NavigationState>(
                  builder: (context, state) {
                    if (state is NavigateToHomePage) {
                      return _popScopeWithWidget(HeroesPage(), context);
                    } else if (state is NavigateToHeroPage) {
                      return _popScopeWithWidget(
                          HeroPage(state.heroId), context);
                    } else {
                      return Placeholder();
                    }
                  },
                ),
              ),
            ),
          ),
        ));
  }

  Widget _popScopeWithWidget(Widget child, BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<NavigationCubit>().goBack();
        return Future.value(false);
      },
      child: child,
    );
  }
}
