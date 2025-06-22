// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function(PostParams params) makePost,
    required TResult Function(String postId) likeOrUnlikePost,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function(PostParams params)? makePost,
    TResult? Function(String postId)? likeOrUnlikePost,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function(PostParams params)? makePost,
    TResult Function(String postId)? likeOrUnlikePost,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPosts value) loadPosts,
    required TResult Function(_MakePost value) makePost,
    required TResult Function(_LikeOrUnlikePost value) likeOrUnlikePost,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPosts value)? loadPosts,
    TResult? Function(_MakePost value)? makePost,
    TResult? Function(_LikeOrUnlikePost value)? likeOrUnlikePost,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPosts value)? loadPosts,
    TResult Function(_MakePost value)? makePost,
    TResult Function(_LikeOrUnlikePost value)? likeOrUnlikePost,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsEventCopyWith<$Res> {
  factory $PostsEventCopyWith(
    PostsEvent value,
    $Res Function(PostsEvent) then,
  ) = _$PostsEventCopyWithImpl<$Res, PostsEvent>;
}

/// @nodoc
class _$PostsEventCopyWithImpl<$Res, $Val extends PostsEvent>
    implements $PostsEventCopyWith<$Res> {
  _$PostsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadPostsImplCopyWith<$Res> {
  factory _$$LoadPostsImplCopyWith(
    _$LoadPostsImpl value,
    $Res Function(_$LoadPostsImpl) then,
  ) = __$$LoadPostsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPostsImplCopyWithImpl<$Res>
    extends _$PostsEventCopyWithImpl<$Res, _$LoadPostsImpl>
    implements _$$LoadPostsImplCopyWith<$Res> {
  __$$LoadPostsImplCopyWithImpl(
    _$LoadPostsImpl _value,
    $Res Function(_$LoadPostsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadPostsImpl implements _LoadPosts {
  const _$LoadPostsImpl();

  @override
  String toString() {
    return 'PostsEvent.loadPosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadPostsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function(PostParams params) makePost,
    required TResult Function(String postId) likeOrUnlikePost,
  }) {
    return loadPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function(PostParams params)? makePost,
    TResult? Function(String postId)? likeOrUnlikePost,
  }) {
    return loadPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function(PostParams params)? makePost,
    TResult Function(String postId)? likeOrUnlikePost,
    required TResult orElse(),
  }) {
    if (loadPosts != null) {
      return loadPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPosts value) loadPosts,
    required TResult Function(_MakePost value) makePost,
    required TResult Function(_LikeOrUnlikePost value) likeOrUnlikePost,
  }) {
    return loadPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPosts value)? loadPosts,
    TResult? Function(_MakePost value)? makePost,
    TResult? Function(_LikeOrUnlikePost value)? likeOrUnlikePost,
  }) {
    return loadPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPosts value)? loadPosts,
    TResult Function(_MakePost value)? makePost,
    TResult Function(_LikeOrUnlikePost value)? likeOrUnlikePost,
    required TResult orElse(),
  }) {
    if (loadPosts != null) {
      return loadPosts(this);
    }
    return orElse();
  }
}

abstract class _LoadPosts implements PostsEvent {
  const factory _LoadPosts() = _$LoadPostsImpl;
}

/// @nodoc
abstract class _$$MakePostImplCopyWith<$Res> {
  factory _$$MakePostImplCopyWith(
    _$MakePostImpl value,
    $Res Function(_$MakePostImpl) then,
  ) = __$$MakePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostParams params});
}

/// @nodoc
class __$$MakePostImplCopyWithImpl<$Res>
    extends _$PostsEventCopyWithImpl<$Res, _$MakePostImpl>
    implements _$$MakePostImplCopyWith<$Res> {
  __$$MakePostImplCopyWithImpl(
    _$MakePostImpl _value,
    $Res Function(_$MakePostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? params = null}) {
    return _then(
      _$MakePostImpl(
        params:
            null == params
                ? _value.params
                : params // ignore: cast_nullable_to_non_nullable
                    as PostParams,
      ),
    );
  }
}

/// @nodoc

class _$MakePostImpl implements _MakePost {
  const _$MakePostImpl({required this.params});

  @override
  final PostParams params;

  @override
  String toString() {
    return 'PostsEvent.makePost(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MakePostImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  /// Create a copy of PostsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MakePostImplCopyWith<_$MakePostImpl> get copyWith =>
      __$$MakePostImplCopyWithImpl<_$MakePostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function(PostParams params) makePost,
    required TResult Function(String postId) likeOrUnlikePost,
  }) {
    return makePost(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function(PostParams params)? makePost,
    TResult? Function(String postId)? likeOrUnlikePost,
  }) {
    return makePost?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function(PostParams params)? makePost,
    TResult Function(String postId)? likeOrUnlikePost,
    required TResult orElse(),
  }) {
    if (makePost != null) {
      return makePost(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPosts value) loadPosts,
    required TResult Function(_MakePost value) makePost,
    required TResult Function(_LikeOrUnlikePost value) likeOrUnlikePost,
  }) {
    return makePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPosts value)? loadPosts,
    TResult? Function(_MakePost value)? makePost,
    TResult? Function(_LikeOrUnlikePost value)? likeOrUnlikePost,
  }) {
    return makePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPosts value)? loadPosts,
    TResult Function(_MakePost value)? makePost,
    TResult Function(_LikeOrUnlikePost value)? likeOrUnlikePost,
    required TResult orElse(),
  }) {
    if (makePost != null) {
      return makePost(this);
    }
    return orElse();
  }
}

abstract class _MakePost implements PostsEvent {
  const factory _MakePost({required final PostParams params}) = _$MakePostImpl;

  PostParams get params;

  /// Create a copy of PostsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MakePostImplCopyWith<_$MakePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikeOrUnlikePostImplCopyWith<$Res> {
  factory _$$LikeOrUnlikePostImplCopyWith(
    _$LikeOrUnlikePostImpl value,
    $Res Function(_$LikeOrUnlikePostImpl) then,
  ) = __$$LikeOrUnlikePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$LikeOrUnlikePostImplCopyWithImpl<$Res>
    extends _$PostsEventCopyWithImpl<$Res, _$LikeOrUnlikePostImpl>
    implements _$$LikeOrUnlikePostImplCopyWith<$Res> {
  __$$LikeOrUnlikePostImplCopyWithImpl(
    _$LikeOrUnlikePostImpl _value,
    $Res Function(_$LikeOrUnlikePostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? postId = null}) {
    return _then(
      _$LikeOrUnlikePostImpl(
        null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$LikeOrUnlikePostImpl implements _LikeOrUnlikePost {
  const _$LikeOrUnlikePostImpl(this.postId);

  @override
  final String postId;

  @override
  String toString() {
    return 'PostsEvent.likeOrUnlikePost(postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeOrUnlikePostImpl &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  /// Create a copy of PostsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeOrUnlikePostImplCopyWith<_$LikeOrUnlikePostImpl> get copyWith =>
      __$$LikeOrUnlikePostImplCopyWithImpl<_$LikeOrUnlikePostImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function(PostParams params) makePost,
    required TResult Function(String postId) likeOrUnlikePost,
  }) {
    return likeOrUnlikePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function(PostParams params)? makePost,
    TResult? Function(String postId)? likeOrUnlikePost,
  }) {
    return likeOrUnlikePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function(PostParams params)? makePost,
    TResult Function(String postId)? likeOrUnlikePost,
    required TResult orElse(),
  }) {
    if (likeOrUnlikePost != null) {
      return likeOrUnlikePost(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadPosts value) loadPosts,
    required TResult Function(_MakePost value) makePost,
    required TResult Function(_LikeOrUnlikePost value) likeOrUnlikePost,
  }) {
    return likeOrUnlikePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadPosts value)? loadPosts,
    TResult? Function(_MakePost value)? makePost,
    TResult? Function(_LikeOrUnlikePost value)? likeOrUnlikePost,
  }) {
    return likeOrUnlikePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadPosts value)? loadPosts,
    TResult Function(_MakePost value)? makePost,
    TResult Function(_LikeOrUnlikePost value)? likeOrUnlikePost,
    required TResult orElse(),
  }) {
    if (likeOrUnlikePost != null) {
      return likeOrUnlikePost(this);
    }
    return orElse();
  }
}

abstract class _LikeOrUnlikePost implements PostsEvent {
  const factory _LikeOrUnlikePost(final String postId) = _$LikeOrUnlikePostImpl;

  String get postId;

  /// Create a copy of PostsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikeOrUnlikePostImplCopyWith<_$LikeOrUnlikePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostsLoadedEntity postsEntity) loaded,
    required TResult Function(String error) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostsLoadedEntity postsEntity)? loaded,
    TResult? Function(String error)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostsLoadedEntity postsEntity)? loaded,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsStateCopyWith<$Res> {
  factory $PostsStateCopyWith(
    PostsState value,
    $Res Function(PostsState) then,
  ) = _$PostsStateCopyWithImpl<$Res, PostsState>;
}

/// @nodoc
class _$PostsStateCopyWithImpl<$Res, $Val extends PostsState>
    implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PostsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostsLoadedEntity postsEntity) loaded,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostsLoadedEntity postsEntity)? loaded,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostsLoadedEntity postsEntity)? loaded,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PostsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PostsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostsLoadedEntity postsEntity) loaded,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostsLoadedEntity postsEntity)? loaded,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostsLoadedEntity postsEntity)? loaded,
    TResult Function(String error)? failure,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PostsState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostsLoadedEntity postsEntity});

  $PostsLoadedEntityCopyWith<$Res> get postsEntity;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? postsEntity = null}) {
    return _then(
      _$LoadedImpl(
        postsEntity:
            null == postsEntity
                ? _value.postsEntity
                : postsEntity // ignore: cast_nullable_to_non_nullable
                    as PostsLoadedEntity,
      ),
    );
  }

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostsLoadedEntityCopyWith<$Res> get postsEntity {
    return $PostsLoadedEntityCopyWith<$Res>(_value.postsEntity, (value) {
      return _then(_value.copyWith(postsEntity: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.postsEntity});

  @override
  final PostsLoadedEntity postsEntity;

  @override
  String toString() {
    return 'PostsState.loaded(postsEntity: $postsEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.postsEntity, postsEntity) ||
                other.postsEntity == postsEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postsEntity);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostsLoadedEntity postsEntity) loaded,
    required TResult Function(String error) failure,
  }) {
    return loaded(postsEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostsLoadedEntity postsEntity)? loaded,
    TResult? Function(String error)? failure,
  }) {
    return loaded?.call(postsEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostsLoadedEntity postsEntity)? loaded,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(postsEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PostsState {
  const factory _Loaded({required final PostsLoadedEntity postsEntity}) =
      _$LoadedImpl;

  PostsLoadedEntity get postsEntity;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
    _$FailureImpl value,
    $Res Function(_$FailureImpl) then,
  ) = __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
    _$FailureImpl _value,
    $Res Function(_$FailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$FailureImpl(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'PostsState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PostsLoadedEntity postsEntity) loaded,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PostsLoadedEntity postsEntity)? loaded,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PostsLoadedEntity postsEntity)? loaded,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements PostsState {
  const factory _Failure({required final String error}) = _$FailureImpl;

  String get error;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
