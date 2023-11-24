// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpisodeStateLoadingImpl _$$EpisodeStateLoadingImplFromJson(
        Map<String, dynamic> json) =>
    _$EpisodeStateLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EpisodeStateLoadingImplToJson(
        _$EpisodeStateLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$EpisodeStateLoadedImpl _$$EpisodeStateLoadedImplFromJson(
        Map<String, dynamic> json) =>
    _$EpisodeStateLoadedImpl(
      episodeLoaded:
          Episode.fromJson(json['episodeLoaded'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EpisodeStateLoadedImplToJson(
        _$EpisodeStateLoadedImpl instance) =>
    <String, dynamic>{
      'episodeLoaded': instance.episodeLoaded,
      'runtimeType': instance.$type,
    };

_$EpisodeStateErrorImpl _$$EpisodeStateErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$EpisodeStateErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EpisodeStateErrorImplToJson(
        _$EpisodeStateErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
