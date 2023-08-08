import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:rick_and_morty_app/presentation/providers/provider/episode_provider.dart';

class SearchCharacter extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final characterProvider = Provider.of<EpisodeProvider>(context);
    Widget loading() {
      return const Center(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 140,
          backgroundImage: AssetImage('assets/images/portal2.gif'),
        ),
      );
    }

    if (query.isEmpty) {
      return loading();
    }
    return FutureBuilder(
      future: characterProvider.getCharacter(query),
      builder: (context, AsyncSnapshot<List<Result>> snapshot) {
        if (snapshot.hasData) {
          return loading();
        }
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final character = snapshot.data![index];
              return ListTile(
                onTap: () {
                  context.go('/character', extra: character);
                },
                title: Text(character.name!),
                leading: Hero(
                  tag: character.id!,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(character.image!),
                  ),
                ),
              );
            });
      },
    );
  }
}
