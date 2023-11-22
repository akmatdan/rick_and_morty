part of 'character_bloc.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.loading() = CharacterStateLoading;
  const factory CharacterState.loaded({required Character characterLoaded}) =
      CharacterStateLaoded;
  const factory CharacterState.error() = CharacterStateError;
}
