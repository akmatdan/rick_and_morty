part of 'episode_bloc.dart';

@freezed
class EpisodeState with _$EpisodeState {
  const factory EpisodeState.loading() = EpisodeStateLoading;
  const factory EpisodeState.loaded({required Episode episodeLoaded}) =
      EpisodeStateLoaded;
  const factory EpisodeState.error() = EpisodeStateError;

  factory EpisodeState.fromJson(Map<String, dynamic> json) =>
      _$EpisodeStateFromJson(json);
}
