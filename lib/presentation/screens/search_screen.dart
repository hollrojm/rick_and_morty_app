import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:rick_and_morty_app/presentation/providers/bloc/character_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final scrollController = ScrollController();
  bool isLoading = false;
  late Character _currentCharacter;
  List<Result> _currentResults = [];
  int _currentPage = 1;
  String _currentSearchStr = '';

  @override
  void initState() {
    if (_currentResults.isEmpty) {
      context
          .read<CharacterBloc>()
          .add(const CharacterEvent.fetch(name: '', page: 1));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>().state;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 1, left: 16, right: 16),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(86, 86, 86, 0.8),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintStyle: const TextStyle(color: Colors.white),
              ),
              onChanged: (value) {
                _currentPage = 1;
                _currentResults = [];
                _currentSearchStr = value;
                context
                    .read<CharacterBloc>()
                    .add(CharacterEvent.fetch(name: value, page: _currentPage));
              },
            ),
          ),
          state.when(
              loading: () {
                return const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Loading...',
                      )
                    ],
                  ),
                );
              },
              loaded: (characterLoaded) {
                _currentCharacter = characterLoaded;
                _currentResults = _currentCharacter.results!;
                return _currentResults.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ((_customGridView(_currentResults))),
                      ) //Text('$_currentResults')
                    : const SizedBox();
              },
              error: () => const Text('No found...')),
        ],
      ),
    );
  }
}

Widget _customGridView(List<Result> currentResult) {
  return GridView.builder(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.87,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10),
    itemBuilder: (context, index) {
      final result = currentResult[index];
      return GestureDetector(
        onTap: () {
          context.go('/character');
        },
        child: Card(
          color: Colors.amber,
          child: Column(children: [
            FadeInImage(
                placeholder:
                    const AssetImage('assets/images/portal-rick-and-morty.gif'),
                image: NetworkImage(result.image!)),
            Text(
              result.name!,
              style: const TextStyle(
                  fontSize: 16, overflow: TextOverflow.ellipsis),
            )
          ]),
        ),
      );
    },
    itemCount: currentResult.length,
  );
}
