import 'dart:convert';

import 'package:rick_and_morty_app/domain/datasources/characters_datasource.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:http/http.dart' as http;

class CharacterDatasource extends CharactersDataSource {
  final baseUrl = 'https://rickandmortyapi.com/api/character';

  @override
  Future<Character> getCharacter({int? page, String? name}) async {
    try {
      var response =
          await http.get(Uri.parse('$baseUrl?page=$page&name=$name'));

      var jsonResult = json.decode(response.body);
      print(jsonResult);
      return Character.fromJson(jsonResult);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
