import 'package:DotaApp/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:DotaApp/cubits/navigation_cubit/navigation_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Navigation Cubit', () {
    blocTest<NavigationCubit, NavigationState>(
        'Emits state for Homepage when asked',
        build: () => NavigationCubit(),
        act: (cubit) => cubit.navigateToHomePage(),
        expect: () => [NavigateToHomePage()]);

    blocTest<NavigationCubit, NavigationState>(
        'Emits state for Hero when asked',
        build: () => NavigationCubit(),
        act: (cubit) => cubit.navigateToHeroesPage(1),
        expect: () => [NavigateToHeroPage(1)]);

    blocTest('Returns previous state when asked to go back',
        build: () => NavigationCubit(),
        act: (dynamic cubit) {
          cubit.navigateToHomePage();
          cubit.navigateToHeroesPage(1);
          cubit.goBack();
        },
        expect: () => [
              NavigateToHomePage(),
              NavigateToHeroPage(1),
              NavigateToHomePage()
            ]);
  });
}
