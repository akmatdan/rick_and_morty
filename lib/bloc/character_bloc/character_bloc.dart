import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:the_rick_and_morty/data/models/character.dart';
import 'package:the_rick_and_morty/data/repositories/character_repo.dart';

part 'character_bloc.freezed.dart';
part 'character_bloc.g.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState>
    with HydratedMixin {
  final CharacterRepo characterRepo;
  CharacterBloc({required this.characterRepo})
      : super(const CharacterState.loading()) {
    on<CharacterEventFetch>((event, emit) async {
      emit(const CharacterState.loading());
      try {
        Character characterLoaded = await characterRepo
            .getCharacter(
              page: event.page,
              name: event.name,
              status: event.status,
              species: event.species,
              gender: event.gender,
            )
            .timeout(const Duration(seconds: 5));
        emit(CharacterState.loaded(characterLoaded: characterLoaded));
      } catch (_) {
        emit(const CharacterState.error());
        rethrow;
      }
    });
  }

  // Restore state
  @override
  CharacterState? fromJson(Map<String, dynamic> json) =>
      CharacterState.fromJson(json);

  // Save state
  @override
  Map<String, dynamic>? toJson(CharacterState state) => state.toJson();
}
