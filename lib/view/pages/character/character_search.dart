import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:the_rick_and_morty/bloc/character_bloc/character_bloc.dart';
import 'package:the_rick_and_morty/data/models/character.dart';
import 'package:the_rick_and_morty/utils/constants/colors.dart';
import 'package:the_rick_and_morty/utils/constants/sizes.dart';
import 'package:the_rick_and_morty/view/pages/character/character_detail_page.dart';
import 'package:the_rick_and_morty/view/widgets/character_list_tile.dart';
import 'package:the_rick_and_morty/view/widgets/character_status.dart';
import 'package:the_rick_and_morty/view/widgets/filter_options.dart';
import 'package:the_rick_and_morty/view/widgets/string_extension.dart';

class CharacterSearch extends StatefulWidget {
  const CharacterSearch({Key? key}) : super(key: key);

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
  SpeciesState? _currentSpecies;
  GenderState? _currentGender;
  late final Set<String> _selectedStatus = {};
  late final Set<String> _selectedSpecies = {};
  late final Set<String> _selectedGender = {};

  @override
  void initState() {
    if (_currentResults.isEmpty) {
      context.read<CharacterBloc>().add(const CharacterEvent.fetch(
            name: '',
            page: 1,
            status: '',
            species: '',
            gender: '',
          ));
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
                      species: _currentSpecies?.toString() ?? '',
                      gender: _currentGender?.toString() ?? '',
                    ));
              },
            ),
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildFilterButton(
                'Status',
                () => _showFilterDialog(
                    'Status', LiveState.values, _selectedStatus),
                _selectedStatus,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              buildFilterButton(
                'Species',
                () => _showFilterDialog(
                    'Species', SpeciesState.values, _selectedSpecies),
                _selectedSpecies,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              buildFilterButton(
                'Gender',
                () => _showFilterDialog(
                    'Gender', GenderState.values, _selectedGender),
                _selectedGender,
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
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
                  species: _currentSpecies?.toString() ?? '',
                  gender: _currentGender?.toString() ?? '',
                ),
              );
        } else {
          refreshController.loadNoData();
        }
      },
      child: ListView.separated(
        itemCount: currentResults.length,
        separatorBuilder: (_, index) => const SizedBox(height: 5),
        shrinkWrap: true, // takes necessary space depend on element
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

  void _showFilterDialog(
      String title, List<dynamic> options, Set<String> selectedOptions) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filter by $title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var option in options)
                FilterOption(
                    title: option.toString().split('.').last,
                    option: option,
                    selectedOptions: selectedOptions,
                    onChanged: (bool value) {
                      setState(
                        () {
                          if (selectedOptions.contains(title)) {
                            selectedOptions.remove(title);
                          } else {
                            selectedOptions.add(title);
                          }
                        },
                      );
                    }),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _applyFilters();
                Navigator.pop(context);
              },
              child: const Text(
                'Apply',
                style: TextStyle(
                  color: TColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _applyFilters() {
    setState(() {
      _currentPage = 1;
      _currentResults = [];
      _currentStatus = _selectedStatus.isNotEmpty
          ? _selectedStatus.first.toLiveState()
          : null;
      _currentSpecies = _selectedSpecies.isNotEmpty
          ? _selectedSpecies.first.toSpeciesState()
          : null;
      _currentGender = _selectedGender.isNotEmpty
          ? _selectedGender.first.toGenderState()
          : null;

      // Map LiveState to corresponding status string
      String statusString = _currentStatus?.toString().split('.').last ?? '';
      String speciesString = _currentSpecies?.toString().split('.').last ?? '';
      String genderString = _currentGender?.toString().split('.').last ?? '';

      context.read<CharacterBloc>().add(
            CharacterEvent.fetch(
              name: _currentSearchStr,
              page: _currentPage,
              status: statusString,
              species: speciesString,
              gender: genderString,
            ),
          );
    });
  }

  Widget buildFilterButton(
    String label,
    void Function()? onPressed,
    Set<String> selectedOptions,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: TColors.primary,
        foregroundColor: TColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
