// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };

_$InfoImpl _$$InfoImplFromJson(Map<String, dynamic> json) => _$InfoImpl(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$$InfoImplToJson(_$InfoImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

_$ResultsImpl _$$ResultsImplFromJson(Map<String, dynamic> json) =>
    _$ResultsImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      origin: Origin.fromJson(json['origin'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      created: json['created'] as String,
    );

Map<String, dynamic> _$$ResultsImplToJson(_$ResultsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'origin': instance.origin,
      'location': instance.location,
      'created': instance.created,
    };

_$OriginImpl _$$OriginImplFromJson(Map<String, dynamic> json) => _$OriginImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$OriginImplToJson(_$OriginImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
