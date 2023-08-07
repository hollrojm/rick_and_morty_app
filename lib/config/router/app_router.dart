import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:rick_and_morty_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        name: CharactersScreen.name,
        builder: (context, state) => CharactersScreen(
              title: 'Rick and Morty',
            ),
        routes: [
          GoRoute(
              path: 'character',
              builder: (context, state) {
                final character = state.extra as Result;
                return CharacterScreen(character: character);
              })
        ])
  ],
);
