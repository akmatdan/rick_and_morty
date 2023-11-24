// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EpisodeEvent {
  String get name => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int page) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, int page)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int page)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EpisodeEventFetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EpisodeEventFetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EpisodeEventFetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EpisodeEventCopyWith<EpisodeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeEventCopyWith<$Res> {
  factory $EpisodeEventCopyWith(
          EpisodeEvent value, $Res Function(EpisodeEvent) then) =
      _$EpisodeEventCopyWithImpl<$Res, EpisodeEvent>;
  @useResult
  $Res call({String name, int page});
}

/// @nodoc
class _$EpisodeEventCopyWithImpl<$Res, $Val extends EpisodeEvent>
    implements $EpisodeEventCopyWith<$Res> {
  _$EpisodeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpisodeEventFetchImplCopyWith<$Res>
    implements $EpisodeEventCopyWith<$Res> {
  factory _$$EpisodeEventFetchImplCopyWith(_$EpisodeEventFetchImpl value,
          $Res Function(_$EpisodeEventFetchImpl) then) =
      __$$EpisodeEventFetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int page});
}

/// @nodoc
class __$$EpisodeEventFetchImplCopyWithImpl<$Res>
    extends _$EpisodeEventCopyWithImpl<$Res, _$EpisodeEventFetchImpl>
    implements _$$EpisodeEventFetchImplCopyWith<$Res> {
  __$$EpisodeEventFetchImplCopyWithImpl(_$EpisodeEventFetchImpl _value,
      $Res Function(_$EpisodeEventFetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? page = null,
  }) {
    return _then(_$EpisodeEventFetchImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EpisodeEventFetchImpl
    with DiagnosticableTreeMixin
    implements EpisodeEventFetch {
  const _$EpisodeEventFetchImpl({required this.name, required this.page});

  @override
  final String name;
  @override
  final int page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EpisodeEvent.fetch(name: $name, page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EpisodeEvent.fetch'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeEventFetchImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeEventFetchImplCopyWith<_$EpisodeEventFetchImpl> get copyWith =>
      __$$EpisodeEventFetchImplCopyWithImpl<_$EpisodeEventFetchImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int page) fetch,
  }) {
    return fetch(name, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, int page)? fetch,
  }) {
    return fetch?.call(name, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int page)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(name, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EpisodeEventFetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EpisodeEventFetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EpisodeEventFetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class EpisodeEventFetch implements EpisodeEvent {
  const factory EpisodeEventFetch(
      {required final String name,
      required final int page}) = _$EpisodeEventFetchImpl;

  @override
  String get name;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$EpisodeEventFetchImplCopyWith<_$EpisodeEventFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EpisodeState _$EpisodeStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return EpisodeStateLoading.fromJson(json);
    case 'loaded':
      return EpisodeStateLoaded.fromJson(json);
    case 'error':
      return EpisodeStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'EpisodeState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$EpisodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Episode episodeLoaded) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Episode episodeLoaded)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Episode episodeLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EpisodeStateLoading value) loading,
    required TResult Function(EpisodeStateLoaded value) loaded,
    required TResult Function(EpisodeStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EpisodeStateLoading value)? loading,
    TResult? Function(EpisodeStateLoaded value)? loaded,
    TResult? Function(EpisodeStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EpisodeStateLoading value)? loading,
    TResult Function(EpisodeStateLoaded value)? loaded,
    TResult Function(EpisodeStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeStateCopyWith<$Res> {
  factory $EpisodeStateCopyWith(
          EpisodeState value, $Res Function(EpisodeState) then) =
      _$EpisodeStateCopyWithImpl<$Res, EpisodeState>;
}

/// @nodoc
class _$EpisodeStateCopyWithImpl<$Res, $Val extends EpisodeState>
    implements $EpisodeStateCopyWith<$Res> {
  _$EpisodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EpisodeStateLoadingImplCopyWith<$Res> {
  factory _$$EpisodeStateLoadingImplCopyWith(_$EpisodeStateLoadingImpl value,
          $Res Function(_$EpisodeStateLoadingImpl) then) =
      __$$EpisodeStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EpisodeStateLoadingImplCopyWithImpl<$Res>
    extends _$EpisodeStateCopyWithImpl<$Res, _$EpisodeStateLoadingImpl>
    implements _$$EpisodeStateLoadingImplCopyWith<$Res> {
  __$$EpisodeStateLoadingImplCopyWithImpl(_$EpisodeStateLoadingImpl _value,
      $Res Function(_$EpisodeStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EpisodeStateLoadingImpl
    with DiagnosticableTreeMixin
    implements EpisodeStateLoading {
  const _$EpisodeStateLoadingImpl({final String? $type})
      : $type = $type ?? 'loading';

  factory _$EpisodeStateLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeStateLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EpisodeState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'EpisodeState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeStateLoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Episode episodeLoaded) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Episode episodeLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Episode episodeLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EpisodeStateLoading value) loading,
    required TResult Function(EpisodeStateLoaded value) loaded,
    required TResult Function(EpisodeStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EpisodeStateLoading value)? loading,
    TResult? Function(EpisodeStateLoaded value)? loaded,
    TResult? Function(EpisodeStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EpisodeStateLoading value)? loading,
    TResult Function(EpisodeStateLoaded value)? loaded,
    TResult Function(EpisodeStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeStateLoadingImplToJson(
      this,
    );
  }
}

abstract class EpisodeStateLoading implements EpisodeState {
  const factory EpisodeStateLoading() = _$EpisodeStateLoadingImpl;

  factory EpisodeStateLoading.fromJson(Map<String, dynamic> json) =
      _$EpisodeStateLoadingImpl.fromJson;
}

/// @nodoc
abstract class _$$EpisodeStateLoadedImplCopyWith<$Res> {
  factory _$$EpisodeStateLoadedImplCopyWith(_$EpisodeStateLoadedImpl value,
          $Res Function(_$EpisodeStateLoadedImpl) then) =
      __$$EpisodeStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Episode episodeLoaded});

  $EpisodeCopyWith<$Res> get episodeLoaded;
}

/// @nodoc
class __$$EpisodeStateLoadedImplCopyWithImpl<$Res>
    extends _$EpisodeStateCopyWithImpl<$Res, _$EpisodeStateLoadedImpl>
    implements _$$EpisodeStateLoadedImplCopyWith<$Res> {
  __$$EpisodeStateLoadedImplCopyWithImpl(_$EpisodeStateLoadedImpl _value,
      $Res Function(_$EpisodeStateLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? episodeLoaded = null,
  }) {
    return _then(_$EpisodeStateLoadedImpl(
      episodeLoaded: null == episodeLoaded
          ? _value.episodeLoaded
          : episodeLoaded // ignore: cast_nullable_to_non_nullable
              as Episode,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EpisodeCopyWith<$Res> get episodeLoaded {
    return $EpisodeCopyWith<$Res>(_value.episodeLoaded, (value) {
      return _then(_value.copyWith(episodeLoaded: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeStateLoadedImpl
    with DiagnosticableTreeMixin
    implements EpisodeStateLoaded {
  const _$EpisodeStateLoadedImpl(
      {required this.episodeLoaded, final String? $type})
      : $type = $type ?? 'loaded';

  factory _$EpisodeStateLoadedImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeStateLoadedImplFromJson(json);

  @override
  final Episode episodeLoaded;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EpisodeState.loaded(episodeLoaded: $episodeLoaded)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EpisodeState.loaded'))
      ..add(DiagnosticsProperty('episodeLoaded', episodeLoaded));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeStateLoadedImpl &&
            (identical(other.episodeLoaded, episodeLoaded) ||
                other.episodeLoaded == episodeLoaded));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, episodeLoaded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeStateLoadedImplCopyWith<_$EpisodeStateLoadedImpl> get copyWith =>
      __$$EpisodeStateLoadedImplCopyWithImpl<_$EpisodeStateLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Episode episodeLoaded) loaded,
    required TResult Function() error,
  }) {
    return loaded(episodeLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Episode episodeLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(episodeLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Episode episodeLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(episodeLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EpisodeStateLoading value) loading,
    required TResult Function(EpisodeStateLoaded value) loaded,
    required TResult Function(EpisodeStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EpisodeStateLoading value)? loading,
    TResult? Function(EpisodeStateLoaded value)? loaded,
    TResult? Function(EpisodeStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EpisodeStateLoading value)? loading,
    TResult Function(EpisodeStateLoaded value)? loaded,
    TResult Function(EpisodeStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeStateLoadedImplToJson(
      this,
    );
  }
}

abstract class EpisodeStateLoaded implements EpisodeState {
  const factory EpisodeStateLoaded({required final Episode episodeLoaded}) =
      _$EpisodeStateLoadedImpl;

  factory EpisodeStateLoaded.fromJson(Map<String, dynamic> json) =
      _$EpisodeStateLoadedImpl.fromJson;

  Episode get episodeLoaded;
  @JsonKey(ignore: true)
  _$$EpisodeStateLoadedImplCopyWith<_$EpisodeStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EpisodeStateErrorImplCopyWith<$Res> {
  factory _$$EpisodeStateErrorImplCopyWith(_$EpisodeStateErrorImpl value,
          $Res Function(_$EpisodeStateErrorImpl) then) =
      __$$EpisodeStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EpisodeStateErrorImplCopyWithImpl<$Res>
    extends _$EpisodeStateCopyWithImpl<$Res, _$EpisodeStateErrorImpl>
    implements _$$EpisodeStateErrorImplCopyWith<$Res> {
  __$$EpisodeStateErrorImplCopyWithImpl(_$EpisodeStateErrorImpl _value,
      $Res Function(_$EpisodeStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$EpisodeStateErrorImpl
    with DiagnosticableTreeMixin
    implements EpisodeStateError {
  const _$EpisodeStateErrorImpl({final String? $type})
      : $type = $type ?? 'error';

  factory _$EpisodeStateErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeStateErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EpisodeState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'EpisodeState.error'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EpisodeStateErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Episode episodeLoaded) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Episode episodeLoaded)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Episode episodeLoaded)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EpisodeStateLoading value) loading,
    required TResult Function(EpisodeStateLoaded value) loaded,
    required TResult Function(EpisodeStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EpisodeStateLoading value)? loading,
    TResult? Function(EpisodeStateLoaded value)? loaded,
    TResult? Function(EpisodeStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EpisodeStateLoading value)? loading,
    TResult Function(EpisodeStateLoaded value)? loaded,
    TResult Function(EpisodeStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeStateErrorImplToJson(
      this,
    );
  }
}

abstract class EpisodeStateError implements EpisodeState {
  const factory EpisodeStateError() = _$EpisodeStateErrorImpl;

  factory EpisodeStateError.fromJson(Map<String, dynamic> json) =
      _$EpisodeStateErrorImpl.fromJson;
}
