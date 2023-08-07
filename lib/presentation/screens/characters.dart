import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/config/theme/app_theme.dart';
import 'package:rick_and_morty_app/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_app/infrastructure/datasources/rick_and_morty_datasource.dart';
import 'package:rick_and_morty_app/presentation/providers/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/presentation/screens/search_screen.dart';

class CharactersScreen extends StatelessWidget {
  static const name = 'characters-screen';
  CharactersScreen({super.key, required this.title});
  final String title;
  final repository = CharacterDatasource();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black54,
            centerTitle: true,
            title: Text(
              title,
              style: AppTheme().getTheme().textTheme.displaySmall,
            ),
          ),
          body: BlocProvider(
            create: (context) => CharacterBloc(
              charactersRepository: repository,
            ),
            child: SearchScreen(),
          ),
        ),
      ],
    );
  }
}
