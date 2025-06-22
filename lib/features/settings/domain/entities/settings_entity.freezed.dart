// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SettingsEntity {
  bool get isDarkMode => throw _privateConstructorUsedError;
  bool get isNotificationsAllowed => throw _privateConstructorUsedError;

  /// Create a copy of SettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsEntityCopyWith<SettingsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEntityCopyWith<$Res> {
  factory $SettingsEntityCopyWith(
    SettingsEntity value,
    $Res Function(SettingsEntity) then,
  ) = _$SettingsEntityCopyWithImpl<$Res, SettingsEntity>;
  @useResult
  $Res call({bool isDarkMode, bool isNotificationsAllowed});
}

/// @nodoc
class _$SettingsEntityCopyWithImpl<$Res, $Val extends SettingsEntity>
    implements $SettingsEntityCopyWith<$Res> {
  _$SettingsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? isNotificationsAllowed = null,
  }) {
    return _then(
      _value.copyWith(
            isDarkMode:
                null == isDarkMode
                    ? _value.isDarkMode
                    : isDarkMode // ignore: cast_nullable_to_non_nullable
                        as bool,
            isNotificationsAllowed:
                null == isNotificationsAllowed
                    ? _value.isNotificationsAllowed
                    : isNotificationsAllowed // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SettingsEntityImplCopyWith<$Res>
    implements $SettingsEntityCopyWith<$Res> {
  factory _$$SettingsEntityImplCopyWith(
    _$SettingsEntityImpl value,
    $Res Function(_$SettingsEntityImpl) then,
  ) = __$$SettingsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkMode, bool isNotificationsAllowed});
}

/// @nodoc
class __$$SettingsEntityImplCopyWithImpl<$Res>
    extends _$SettingsEntityCopyWithImpl<$Res, _$SettingsEntityImpl>
    implements _$$SettingsEntityImplCopyWith<$Res> {
  __$$SettingsEntityImplCopyWithImpl(
    _$SettingsEntityImpl _value,
    $Res Function(_$SettingsEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkMode = null,
    Object? isNotificationsAllowed = null,
  }) {
    return _then(
      _$SettingsEntityImpl(
        isDarkMode:
            null == isDarkMode
                ? _value.isDarkMode
                : isDarkMode // ignore: cast_nullable_to_non_nullable
                    as bool,
        isNotificationsAllowed:
            null == isNotificationsAllowed
                ? _value.isNotificationsAllowed
                : isNotificationsAllowed // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$SettingsEntityImpl implements _SettingsEntity {
  const _$SettingsEntityImpl({
    required this.isDarkMode,
    required this.isNotificationsAllowed,
  });

  @override
  final bool isDarkMode;
  @override
  final bool isNotificationsAllowed;

  @override
  String toString() {
    return 'SettingsEntity(isDarkMode: $isDarkMode, isNotificationsAllowed: $isNotificationsAllowed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsEntityImpl &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode) &&
            (identical(other.isNotificationsAllowed, isNotificationsAllowed) ||
                other.isNotificationsAllowed == isNotificationsAllowed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isDarkMode, isNotificationsAllowed);

  /// Create a copy of SettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsEntityImplCopyWith<_$SettingsEntityImpl> get copyWith =>
      __$$SettingsEntityImplCopyWithImpl<_$SettingsEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _SettingsEntity implements SettingsEntity {
  const factory _SettingsEntity({
    required final bool isDarkMode,
    required final bool isNotificationsAllowed,
  }) = _$SettingsEntityImpl;

  @override
  bool get isDarkMode;
  @override
  bool get isNotificationsAllowed;

  /// Create a copy of SettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsEntityImplCopyWith<_$SettingsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
