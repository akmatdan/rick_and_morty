import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:the_rick_and_morty/bloc/character_bloc/character_bloc.dart';
import 'package:the_rick_and_morty/data/models/character.dart';
import 'package:the_rick_and_morty/utils/constants/colors.dart';
import 'package:the_rick_and_morty/view/pages/character/character_detail_page.dart';
import 'package:the_rick_and_morty/view/widgets/character_list_tile.dart';
import 'package:the_rick_and_morty/view/widgets/character_status.dart';

class CharacterSearch extends StatefulWidget {
  const CharacterSearch({super.key});

  @override
  State<CharacterSearch> createState() => _CharacterSearchState();
}

class _CharacterSearchState extends State<CharacterSearch> {
  late Character _currentCharacter;
  List<Results> _currentResults = [];
  int _currentPage = 1;
  String _currentSearchStr = '';

  final RefreshController refreshController = RefreshController();
  bool _isPagination = false;

  LiveState? _currentStatus;
  late Set<LiveState> _selectedOptions = {};

  @override
  void initState() {
    if (_currentResults.isEmpty) {
      context
          .read<CharacterBloc>()
          .add(const CharacterEvent.fetch(name: '', page: 1, status: ''));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>().state;

    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, right: 16, left: 16),
            child: TextField(
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                filled: true,
                fillColor: TColors.lightContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(Icons.search, color: TColors.black),
                hintText: 'Search character',
                hintStyle: const TextStyle(color: TColors.black),
              ),

              // Method for TextField
              onChanged: (value) {
                _currentPage = 1;
                _currentResults = [];
                _currentSearchStr = value;
                _applyFilters();

                context.read<CharacterBloc>().add(CharacterEvent.fetch(
                      name: value,
                      page: _currentPage,
                      status: _currentStatus?.toString() ?? '',
                    ));
              },
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => _showFilterDialog(),
            child: const Text('Filter'),
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
                  status: _currentStatus?.toString() ?? '',
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
              child: CharacterListTile(results: results),
            ),
          );
        },
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFilterOption('Alive', LiveState.alive),
              _buildFilterOption('Dead', LiveState.dead),
              _buildFilterOption('Unknown', LiveState.unknown),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Apply the filter options and fetch data
                _applyFilters();
                Navigator.pop(context);
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFilterOption(String title, LiveState status) {
    return StatefulBuilder(
      builder: (context, setState) {
        return ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: () {
            setState(() {
              if (_selectedOptions.contains(status)) {
                _selectedOptions.remove(status);
              } else {
                _selectedOptions.add(status);
              }
            });
          },
          leading: Checkbox(
            value: _selectedOptions.contains(status),
            onChanged: (bool? value) {
              setState(() {
                if (_selectedOptions.contains(status)) {
                  _selectedOptions.remove(status);
                } else {
                  _selectedOptions.add(status);
                }
              });
            },
          ),
        );
      },
    );
  }

  // Call this method to apply filters based on _selectedOptions
  void _applyFilters() {
    setState(() {
      _currentPage = 1;
      _currentResults = [];
      _currentStatus =
          _selectedOptions.isNotEmpty ? _selectedOptions.first : null;

      // Map LiveState to corresponding status string
      String statusString = _currentStatus?.toString().split('.').last ?? '';

      context.read<CharacterBloc>().add(CharacterEvent.fetch(
            name: _currentSearchStr,
            page: _currentPage,
            status: statusString,
          ));
    });
  }
}
