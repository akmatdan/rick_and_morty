import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:the_rick_and_morty/bloc/character_bloc/character_bloc.dart';
import 'package:the_rick_and_morty/data/repositories/character_repo.dart';
import 'package:the_rick_and_morty/view/home/navigation_menu.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final repository = CharacterRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CharacterBloc(characterRepo: repository),
        child: Container(
          decoration: const BoxDecoration(color: Colors.black87),
          child: const NavigationMenu(),
        ),
      ),
    );
  }
}
