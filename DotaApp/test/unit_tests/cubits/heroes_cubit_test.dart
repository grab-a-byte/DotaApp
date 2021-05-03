import 'package:DotaApp/client/models/hero/hero.dart';
import 'package:DotaApp/client/stratz_client_interface.dart';
import 'package:DotaApp/cubits/heroes_cubit/heroes_cubit.dart';
import 'package:DotaApp/cubits/heroes_cubit/heroes_cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/heroes_helpers.dart';

class MockStratzClient extends Mock implements IStratzClient {}

void main() {
  group("Heroes Cubit", () {
    IStratzClient client = MockStratzClient();

    var clientReponse = getMultipleHeroInList();

    when(client.getHeroes()).thenAnswer((_) async => clientReponse);

    blocTest<HeroesCubit, HeroesCubitState>("Emits state with Heores",
        build: () => HeroesCubit(client: client),
        act: (cubit) async => cubit.getHeroes(),
        expect: [LoadingHeroes(), HeroesLoaded(clientReponse)]);

    test("Filters heroes correctly", () async {
      var cubit = HeroesCubit(client: client);

      await cubit.filterHeroes("bob");

      expect(
          cubit.state,
          HeroesLoaded([
            Hero(1, "bob", "bob", "bob", [], []),
          ]));
    });
  });
}
