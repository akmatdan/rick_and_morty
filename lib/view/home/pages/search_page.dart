import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_rick_and_morty/bloc/character_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context
        .read<CharacterBloc>()
        .add(const CharacterEvent.fetch(name: '', page: 1));
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
            onChanged: (value) {
              context
                  .read<CharacterBloc>()
                  .add(CharacterEvent.fetch(name: value, page: 1));
            },
          ),
        ),
        state.when(
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
            loaded: (characterLoaded) => Text('${characterLoaded.info}'),
            error: () => const Text('Nothing found...')),
      ],
    );
  }
}
