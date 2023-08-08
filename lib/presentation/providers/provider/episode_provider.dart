import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:rick_and_morty_app/infrastructure/models/episode.dart';
import 'package:http/http.dart' as http;

class EpisodeProvider with ChangeNotifier {
  List<EpisodeResponse> episodes = [];
  final baseUrl = 'rickandmortyapi.com';

  Future<List<EpisodeResponse>> getEpisodes(Result result) async {
    episodes = [];
    for (var i = 0; i < result.episode!.length; i++) {
      final resultEpisode = await http.get(Uri.parse(result.episode![i]));
      final response = episodeResponseFromJson(resultEpisode.body);
      episodes.add(response);
      notifyListeners();
    }
    return episodes;
  }

  Future<List<Result>> getCharacter(String name) async {
    final response =
        await http.get(Uri.https(baseUrl, '/api/character/', {'name': name}));
    final data = characterFromJson(response.body);
    return data.results!;
  }
}
