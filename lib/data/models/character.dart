import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Character with _$Character {
  const factory Character({
    required Info info,
    required List<Results> results,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
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
    required String status,
    required String species,
    required String gender,
    required String image,
    required List<String> episode,
    required String url,
    required Origin origin,
    required Location location,
    required String created,
  }) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Origin with _$Origin {
  const factory Origin({
    required String name,
    required String url,
  }) = _Origin;

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Location with _$Location {
  const factory Location({
    required String name,
    required String url,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
