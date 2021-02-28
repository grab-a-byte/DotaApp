import 'package:DotaApp/client/models/hero/hero.dart';
import 'package:DotaApp/client/models/hero/hero_role.dart' as h_role;
import 'package:DotaApp/client/models/hero_role/hero_role.dart' as role;
import 'package:DotaApp/client/stratz_client_interface.dart';
import 'package:DotaApp/cubits/hero_cubit/hero_cubit.dart';
import 'package:DotaApp/cubits/hero_cubit/hero_cubit_state.dart';
import 'package:DotaApp/view_models/hero_view_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements IStratzClient {}

void main() {
  group("HeroCubit", () {
    MockClient client = MockClient();
    Hero hero = Hero(1, "test", "test", "test", [h_role.HeroRole(0, 1)]);
    role.HeroRole heroRole = role.HeroRole(0, "carry", "roles.carry");

    when(client.getHeroes()).thenAnswer((_) async => [hero]);
    when(client.getHeroRoles()).thenAnswer((_) async => [heroRole]);

    var expectedRepsonse =
        HeroViewModel(hero.displayName, hero.shortName, [heroRole.name]);
    blocTest("Emits Loading then Hero when getting Hero",
        build: () => HeroCubit(client),
        act: (cubit) async => await cubit.getHero(1),
        expect: [
          HeroCubitState(isLoading: true, hero: null),
          HeroCubitState(isLoading: false, hero: expectedRepsonse)
        ]);
  });
}
