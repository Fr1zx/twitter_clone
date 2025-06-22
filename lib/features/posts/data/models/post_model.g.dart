// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      postId: json['postId'] as String,
      user: json['user'] as Map<String, dynamic>,
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String?,
      date: json['date'] as String,
      likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'user': instance.user,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'date': instance.date,
      'likes': instance.likes,
    };
