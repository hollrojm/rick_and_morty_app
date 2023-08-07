import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/infrastructure/models/character_response.dart';
import 'package:rick_and_morty_app/presentation/widgets/data_card.dart';

class CharacterScreen extends StatelessWidget {
  final Result character;
  const CharacterScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(character.name!),
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
          ],
        ),
      ),
    );
  }
}
