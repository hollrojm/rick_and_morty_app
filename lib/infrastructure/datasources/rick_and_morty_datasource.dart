import 'dart:convert';

import 'package:rick_and_morty_app/domain/datasources/characters_datasource.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:http/http.dart' as http;

class CharacterDatasource extends CharactersDataSource {
  final baseUrl = 'rickandmortyapi.com';

  @override
  Future<Character> getCharacter({int? page, String? name}) async {
    try {
      var response = await http.get(Uri.https(baseUrl, '/api/character/', {
        'page': page.toString(),
      }));

      var jsonResult = json.decode(response.body);
      print(jsonResult);
      return Character.fromJson(jsonResult);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
