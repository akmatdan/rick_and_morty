import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_rick_and_morty/bloc/episode_bloc/episode_bloc.dart';
import 'package:the_rick_and_morty/data/models/episode.dart';
import 'package:the_rick_and_morty/utils/constants/colors.dart';
import 'package:the_rick_and_morty/view/pages/episode/episode_detail_page.dart';
import 'package:the_rick_and_morty/view/widgets/episode_list_tile.dart';

class EpisodeSearch extends StatefulWidget {
  const EpisodeSearch({super.key});

  @override
  State<EpisodeSearch> createState() => _EpisodeSearchState();
}

class _EpisodeSearchState extends State<EpisodeSearch> {
  late Episode _currentEpisode;
  List<Results> _currentResults = [];
  int _currentPage = 1;
  String _currentSearchStr = '';

  final RefreshController refreshController = RefreshController();
  bool _isPagination = false;

  @override
  void initState() {
    if (_currentResults.isEmpty) {
      context
          .read<EpisodeBloc>()
          .add(const EpisodeEvent.fetch(name: '', page: 1));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EpisodeBloc>().state;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, right: 16, left: 16),
            child: TextField(
              style: Theme.of(context).textTheme.bodyLarge,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: TColors.lightContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: TColors.black),
                hintText: 'Search episode',
                hintStyle: const TextStyle(color: TColors.black),
              ),

              // Method for TextField
              onChanged: (value) {
                _currentPage = 1;
                _currentResults = [];
                _currentSearchStr = value;

                context
                    .read<EpisodeBloc>()
                    .add(EpisodeEvent.fetch(name: value, page: _currentPage));
              },
            ),
          ),

          // States
          Expanded(
            child: state.when(
              // Loading state
              loading: () {
                if (!_isPagination) {
                  return const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(strokeWidth: 2),
                        SizedBox(width: 10),
                        Text('Loading...'),
                      ],
                    ),
                  );
                } else {
                  return _episodeListView(_currentResults);
                }
              },

              // Loaded state
              loaded: (episodeLoaded) {
                _currentEpisode = episodeLoaded;
                if (_isPagination) {
                  _currentResults = List.from(_currentResults)
                    ..addAll(_currentEpisode.results);
                  refreshController.loadComplete();
                  _isPagination = false;
                } else {
                  _currentResults = List.from(_currentEpisode.results);
                }

                return _currentResults.isNotEmpty
                    ? _episodeListView(_currentResults)
                    : const SizedBox();
              },

              // Error state
              error: () => const Text('Nothing found...'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _episodeListView(List<Results> currentResults) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      enablePullDown: false,
      onLoading: () {
        _isPagination = true;
        _currentPage++;
        if (_currentPage <= _currentEpisode.info.pages) {
          context.read<EpisodeBloc>().add(
                EpisodeEvent.fetch(
                  name: _currentSearchStr,
                  page: _currentPage,
                ),
              );
        } else {
          refreshController.loadNoData();
        }
      },
      child: ListView.separated(
        itemCount: currentResults.length,
        separatorBuilder: (_, index) => const SizedBox(height: 5),
        shrinkWrap: true, // takes neccesary space depend on element
        itemBuilder: (context, index) {
          final results = currentResults[index];

          // Episode Card with GestureDetector
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EpisodeDetail(results: results),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 3,
                bottom: 3,
                right: 15,
                left: 15,
              ),
              child: EpisodeListTile(results: results),
            ),
          );
        },
      ),
    );
  }
}
