import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/config/router/app_router.dart';
import 'package:rick_and_morty_app/config/theme/app_theme.dart';
import 'package:rick_and_morty_app/presentation/providers/provider/episode_provider.dart';
import 'package:rick_and_morty_app/presentation/providers/provider/location_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EpisodeProvider>(
            create: (_) => EpisodeProvider()),
        ChangeNotifierProvider<LocationProvider>(
            create: (_) => LocationProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty',
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
