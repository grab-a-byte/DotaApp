import 'package:DotaApp/pages/hero_page/hero_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/navigation_cubit/navigation_cubit.dart';
import 'cubits/navigation_cubit/navigation_state.dart';
import 'infrastructure/get_it.dart';
import 'pages/heroes_page/heroes_page.dart';

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
        home: BlocProvider(
          create: (_) => NavigationCubit()..navigateToHomePage(),
          child: Scaffold(
            body: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                if (state is NavigateToHomePage) {
                  return _popScopeWithWidget(HeroesPage(), context);
                } else if (state is NavigateToHeroPage) {
                  return _popScopeWithWidget(HeroPage(state.heroId), context);
                } else {
                  return Placeholder();
                }
              },
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
