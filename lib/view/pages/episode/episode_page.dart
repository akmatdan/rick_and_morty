import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_rick_and_morty/bloc/episode_bloc/episode_bloc.dart';
import 'package:the_rick_and_morty/data/repositories/episode_repo.dart';
import 'package:the_rick_and_morty/utils/constants/colors.dart';
import 'package:the_rick_and_morty/view/pages/episode/episode_search.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key}) : super(key: key);

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
        create: (context) => EpisodeBloc(episodeRepo: EpisodeRepo()),
        child: const EpisodeSearch(),
      ),
    );
  }
}
