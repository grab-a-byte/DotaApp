import 'package:DotaApp/client/stratz_client_interface.dart';
import 'package:DotaApp/cubits/HeroesCubit/heroes_cubit.dart';
import 'package:DotaApp/cubits/HeroesCubit/heroes_cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/HeroesHelpers.dart';

class MockStratzClient extends Mock implements IStratzClient {}

void main() {
  group("Heroes Cubit", () {
    IStratzClient client = MockStratzClient();

    var clientReponse = getSingleHeroInList();

    when(client.getHeroes()).thenAnswer((_) async => clientReponse);

    blocTest<HeroesCubit, HeroesCubitState>("Emits state with Heores",
        build: () => HeroesCubit(client),
        act: (cubit) async => cubit.getHeroes(),
        expect: [
          HeroesCubitState(true, []),
          HeroesCubitState(false, clientReponse)
        ]);
  });
}
