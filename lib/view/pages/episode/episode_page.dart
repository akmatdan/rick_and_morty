import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_rick_and_morty/bloc/episode_bloc/episode_bloc.dart';
import 'package:the_rick_and_morty/data/repositories/episode_repo.dart';
import 'package:the_rick_and_morty/view/pages/episode/search_episode.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => EpisodeBloc(episodeRepo: EpisodeRepo()),
        child: const SearchEpisode(),
      ),
    );
  }
}
