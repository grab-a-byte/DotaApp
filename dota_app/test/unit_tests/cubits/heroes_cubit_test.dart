import 'package:dota_app/client/models/hero/hero.dart';
import 'package:dota_app/client/stratz_client_interface.dart';
import 'package:dota_app/cubits/heroes_cubit/heroes_cubit.dart';
import 'package:dota_app/cubits/heroes_cubit/heroes_cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../helpers/heroes_helpers.dart';
import '../mocks_implementations/mock_stratz_client.dart';

void main() {
  group("Heroes Cubit", () {
    var clientResponse = getMultipleHeroInList();

    IStratzClient client = MockStratzClient(heroResponse: clientResponse);

    blocTest<HeroesCubit, HeroesCubitState>("Emits state with Heores",
        build: () => HeroesCubit(client: client),
        act: (cubit) async => cubit.getHeroes(),
        expect: () => [LoadingHeroes(), HeroesLoaded(clientResponse)]);

    test("Filters heroes correctly", () async {
      var cubit = HeroesCubit(client: client);

      await cubit.filterHeroes("bob");

      expect(
          cubit.state,
          HeroesLoaded([
            Hero(1, "bob", "bob", [], [], null),
          ]));
    });
  });
}
