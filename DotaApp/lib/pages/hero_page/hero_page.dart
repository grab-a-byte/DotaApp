import 'package:DotaApp/cubits/hero_cubit/hero_cubit.dart';
import 'package:DotaApp/cubits/hero_cubit/hero_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroPage extends StatelessWidget {
  final int _heroId;

  HeroPage(this._heroId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HeroCubit()..getHero(_heroId),
      child: BlocBuilder<HeroCubit, HeroCubitState>(
        builder: (context, state) {
          return Placeholder();
        },
      ),
    );
  }
}
