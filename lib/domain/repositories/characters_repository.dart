import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';

abstract class CharactersRepository {
  Future<Character> getCharacter(
    int page,
    String name,
  );
}
