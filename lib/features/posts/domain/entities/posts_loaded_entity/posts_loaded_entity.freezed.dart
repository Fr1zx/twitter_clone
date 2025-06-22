// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_loaded_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostsLoadedEntity {
  List<PostEntity> get posts => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  /// Create a copy of PostsLoadedEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostsLoadedEntityCopyWith<PostsLoadedEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsLoadedEntityCopyWith<$Res> {
  factory $PostsLoadedEntityCopyWith(
    PostsLoadedEntity value,
    $Res Function(PostsLoadedEntity) then,
  ) = _$PostsLoadedEntityCopyWithImpl<$Res, PostsLoadedEntity>;
  @useResult
  $Res call({List<PostEntity> posts, String uid});
}

/// @nodoc
class _$PostsLoadedEntityCopyWithImpl<$Res, $Val extends PostsLoadedEntity>
    implements $PostsLoadedEntityCopyWith<$Res> {
  _$PostsLoadedEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsLoadedEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? posts = null, Object? uid = null}) {
    return _then(
      _value.copyWith(
            posts:
                null == posts
                    ? _value.posts
                    : posts // ignore: cast_nullable_to_non_nullable
                        as List<PostEntity>,
            uid:
                null == uid
                    ? _value.uid
                    : uid // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostsLoadedEntityImplCopyWith<$Res>
    implements $PostsLoadedEntityCopyWith<$Res> {
  factory _$$PostsLoadedEntityImplCopyWith(
    _$PostsLoadedEntityImpl value,
    $Res Function(_$PostsLoadedEntityImpl) then,
  ) = __$$PostsLoadedEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PostEntity> posts, String uid});
}

/// @nodoc
class __$$PostsLoadedEntityImplCopyWithImpl<$Res>
    extends _$PostsLoadedEntityCopyWithImpl<$Res, _$PostsLoadedEntityImpl>
    implements _$$PostsLoadedEntityImplCopyWith<$Res> {
  __$$PostsLoadedEntityImplCopyWithImpl(
    _$PostsLoadedEntityImpl _value,
    $Res Function(_$PostsLoadedEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsLoadedEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? posts = null, Object? uid = null}) {
    return _then(
      _$PostsLoadedEntityImpl(
        posts:
            null == posts
                ? _value._posts
                : posts // ignore: cast_nullable_to_non_nullable
                    as List<PostEntity>,
        uid:
            null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PostsLoadedEntityImpl implements _PostsLoadedEntity {
  const _$PostsLoadedEntityImpl({
    required final List<PostEntity> posts,
    required this.uid,
  }) : _posts = posts;

  final List<PostEntity> _posts;
  @override
  List<PostEntity> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final String uid;

  @override
  String toString() {
    return 'PostsLoadedEntity(posts: $posts, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsLoadedEntityImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_posts),
    uid,
  );

  /// Create a copy of PostsLoadedEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsLoadedEntityImplCopyWith<_$PostsLoadedEntityImpl> get copyWith =>
      __$$PostsLoadedEntityImplCopyWithImpl<_$PostsLoadedEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _PostsLoadedEntity implements PostsLoadedEntity {
  const factory _PostsLoadedEntity({
    required final List<PostEntity> posts,
    required final String uid,
  }) = _$PostsLoadedEntityImpl;

  @override
  List<PostEntity> get posts;
  @override
  String get uid;

  /// Create a copy of PostsLoadedEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostsLoadedEntityImplCopyWith<_$PostsLoadedEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
