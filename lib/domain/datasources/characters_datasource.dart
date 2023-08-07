import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';

abstract class CharactersDataSource {
  Future<Character> getCharacter({required int page, required String name});
}
