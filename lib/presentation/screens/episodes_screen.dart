import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/config/theme/app_theme.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:rick_and_morty_app/presentation/providers/provider/episode_provider.dart';
import 'package:rick_and_morty_app/presentation/screens/episode_detail_screen.dart';

class EpisodeList extends StatefulWidget {
  const EpisodeList({super.key, required this.size, required this.result});
  final Size size;
  final Result result;

  @override
  State<EpisodeList> createState() => _EpisodeListState();
}

class _EpisodeListState extends State<EpisodeList> {
  @override
  void initState() {
    final episodeProvider =
        Provider.of<EpisodeProvider>(context, listen: false);
    episodeProvider.getEpisodes(widget.result);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final episodeProvider = Provider.of<EpisodeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          '${widget.result.name!} Episodios',
          style: AppTheme().getTheme().textTheme.displaySmall,
        ),
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        //height: widget.size.height * 0.35,
        child: ListView.builder(
          itemCount: episodeProvider.episodes.length,
          itemBuilder: ((context, index) {
            final episode = episodeProvider.episodes[index];
            return Material(
              color: Colors.black,
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 14.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EpisodeDetailScreen(
                          episode: episode,
                          result: widget.result,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B3F43),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            ),
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          constraints: const BoxConstraints.expand(),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(children: [
                              Text('${episode.id!}.',
                                  overflow: TextOverflow.clip,
                                  style: AppTheme()
                                      .getTheme()
                                      .textTheme
                                      .bodyLarge),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                episode.name!,
                                overflow: TextOverflow.clip,
                                style:
                                    AppTheme().getTheme().textTheme.bodyLarge,
                              )
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
