import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_rick_and_morty/bloc/character_bloc/character_bloc.dart';
import 'package:the_rick_and_morty/data/repositories/character_repo.dart';
import 'package:the_rick_and_morty/utils/constants/colors.dart';
import 'package:the_rick_and_morty/view/pages/character/character_search.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: TColors.secondary,
        title: Text(
          'The Rick and Morty',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BlocProvider(
        create: (context) => CharacterBloc(characterRepo: CharacterRepo()),
        child: const CharacterSearch(),
      ),
    );
  }
}
