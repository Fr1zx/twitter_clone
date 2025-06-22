// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      username: json['username'] as String,
      email: json['email'] as String,
      userPhoto: json['userPhoto'] as String,
      bio: json['bio'] as String,
      creationDate: json['creationDate'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'userPhoto': instance.userPhoto,
      'bio': instance.bio,
      'creationDate': instance.creationDate,
    };
