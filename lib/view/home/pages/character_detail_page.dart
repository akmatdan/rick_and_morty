import 'package:flutter/material.dart';
import 'package:the_rick_and_morty/data/models/character.dart';

class CharacterDetail extends StatelessWidget {
  final Results results;

  const CharacterDetail({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(results.name),
      ),
      body: const Center(
        child: Text('Character Detail Page'),
      ),
    );
  }
}
