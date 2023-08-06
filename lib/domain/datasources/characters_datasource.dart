import 'package:rick_and_morty_app/domain/entities/character.dart';

abstract class CharactersDataSource {
  Future<Character> getCharacter({int page, String name});
}
