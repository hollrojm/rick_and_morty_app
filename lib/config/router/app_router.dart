import 'package:go_router/go_router.dart';
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
    )
  ],
);
