import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:rick_and_morty_app/infrastructure/datasources/rick_and_morty_datasource.dart';

abstract class CharactersRepository {
  Future<Character> getCharacter(
    int page,
    String name,
  );
}
