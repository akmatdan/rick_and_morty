import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Episode with _$Episode {
  const factory Episode({
    required Info info,
    required List<Results> results,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Info with _$Info {
  const factory Info({
    required int count,
    required int pages,
    String? next,
    String? prev,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Results with _$Results {
  const factory Results({
    required int id,
    required String name,
    required String air_date,
    required String episode,
    required List<String> characters,
    String? url,
    String? created,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
