import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_rick_and_morty/bloc/character_bloc.dart';
import 'package:the_rick_and_morty/data/models/character.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Supporting vars
  late Character _currentCharacter;
  List<Results> _currentResults = [];
  int _currentPage = 1;
  String _currentSearchStr = '';

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

    return Column(
      children: [
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
              hintStyle: const TextStyle(color: Colors.grey),
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
              return const Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircularProgressIndicator(strokeWidth: 2),
                  SizedBox(width: 10),
                  Text('Loading...'),
                ]),
              );
            },

            // Loaded state
            loaded: (characterLoaded) {
              _currentCharacter = characterLoaded;
              _currentResults = _currentCharacter.results;
              return _currentResults.isNotEmpty
                  ? Text('$_currentResults')
                  : const SizedBox();
            },

            // Error state
            error: () => const Text('Nothing found...'),
          ),
        ),
      ],
    );
  }

  Widget _customListView(List<Results> currentResults) {
    return ListView.separated(
      itemCount: currentResults.length,
      separatorBuilder: (_, index) => const SizedBox(height: 5),
      shrinkWrap: true, // takes neccesary space depend on element
      itemBuilder: (context, index) {
        final result = currentResults[index];
        return ListTile(
          title: Text(
            result.name,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
