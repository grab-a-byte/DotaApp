import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'client/stratz_client_interface.dart';
import 'cubits/heroes_cubit/heroes_cubit.dart';
import 'cubits/navigation_cubit/navigation_cubit.dart';
import 'infrastructure/get_it.dart';
import 'infrastructure/hive_setup.dart';
import 'widgets/app_navigator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  await initializeHive();
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
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) {
              return NavigationCubit()..navigateToHomePage();
            }),
            // BlocProvider(create: (_) {
            //   return HeroCubit(
            //     client: getIt.get<IStratzClient>(),
            //     mapper: HeroMapper(HeroAbilityMapper(), HeroStatMapper()),
            //   );
            // }),
            BlocProvider(create: (_) {
              return HeroesCubit(
                client: getIt.get<IStratzClient>(),
              )..getHeroes();
            })
          ],
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
                child: AppNavigator(),
              ),
            ),
          ),
        ));
  }
}
