import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:the_rick_and_morty/bloc/character_bloc.dart';
import 'package:the_rick_and_morty/data/models/character.dart';
import 'package:the_rick_and_morty/view/home/pages/character_detail_page.dart';
import 'package:the_rick_and_morty/view/home/widgets/custom_list_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Character _currentCharacter;
  List<Results> _currentResults = [];
  int _currentPage = 1;
  String _currentSearchStr = '';

  final RefreshController refreshController = RefreshController();
  bool _isPagination = false;

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        centerTitle: true,
        title: Text(
          'The Rick and Morty',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'Characters',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, right: 16, left: 16),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(86, 86, 86, 0.8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                hintText: 'Search name',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),

              // Method for TextField
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
                  return _customListView(_currentResults);
                }
              },

              // Loaded state
              loaded: (characterLoaded) {
                _currentCharacter = characterLoaded;
                if (_isPagination) {
                  _currentResults = List.from(_currentResults)
                    ..addAll(_currentCharacter.results);
                  refreshController.loadComplete();
                  _isPagination = false;
                } else {
                  _currentResults = List.from(_currentCharacter.results);
                }

                return _currentResults.isNotEmpty
                    ? _customListView(_currentResults)
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

  Widget _customListView(List<Results> currentResults) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      enablePullDown: false,
      onLoading: () {
        _isPagination = true;
        _currentPage++;
        if (_currentPage <= _currentCharacter.info.pages) {
          context.read<CharacterBloc>().add(
                CharacterEvent.fetch(
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

          // Character Card with GestureDetector
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterDetail(results: results),
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
              child: CustomListTile(results: results),
            ),
          );
        },
      ),
    );
  }
}
