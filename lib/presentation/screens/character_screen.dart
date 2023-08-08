import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/config/theme/app_theme.dart';

import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:rick_and_morty_app/presentation/screens/episodes_screen.dart';
import 'package:rick_and_morty_app/presentation/screens/locations_screen.dart';
import 'package:rick_and_morty_app/presentation/widgets/data_card.dart';

class CharacterScreen extends StatelessWidget {
  final Result character;
  const CharacterScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
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
              character.name!,
              style: AppTheme().getTheme().textTheme.displaySmall,
            ),
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.35,
                  width: double.infinity,
                  child: Hero(
                    tag: character.id!,
                    child: Image.network(
                      character.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: size.height * 0.14,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dataCard('Estado:', character.status!),
                      dataCard('Especie:', character.species!.name),
                      dataCard('Origen:', character.origin!.name!)
                    ],
                  ),
                ),
                const Text(
                  'Episodios',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EpisodeList(size: size, result: character),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  child: const Text('Episodios'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocationsList(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  child: const Text('Lugares'),
                ),
                //
              ],
            ),
          ),
        ),
      ],
    );
  }
}
