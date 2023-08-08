import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/config/theme/app_theme.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:rick_and_morty_app/infrastructure/models/episode.dart';

class EpisodeDetailScreen extends StatefulWidget {
  const EpisodeDetailScreen(
      {super.key, required this.episode, required this.result});
  final EpisodeResponse episode;
  final Result result;

  @override
  State<EpisodeDetailScreen> createState() => _EpisodeDetailScreenState();
}

class _EpisodeDetailScreenState extends State<EpisodeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/background.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              '${widget.episode.id}. ${widget.episode.name!}',
              overflow: TextOverflow.ellipsis,
              style: AppTheme().getTheme().textTheme.displaySmall,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Episodio : ${widget.episode.episode}',
                      style: AppTheme().getTheme().textTheme.displaySmall,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Al aire : ${widget.episode.created}',
                      style: AppTheme().getTheme().textTheme.displaySmall,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Url : ${widget.episode.url}',
                  style: AppTheme().getTheme().textTheme.displaySmall,
                ),
              ],
            ),
          )),
    ]);
  }
}
