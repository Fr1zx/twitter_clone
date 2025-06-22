import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/core/models/user_model.dart';
import 'package:frizter/features/posts/domain/entities/post_entity/post_entity.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required String postId,
    required Map<String, dynamic> user,
    required String title,
    required String content,
    required String? image,
    required String date,
    required List<String> likes,
  }) = _PostModel;
  const PostModel._();
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  PostEntity toEntity() {
    return PostEntity(
      postId: postId,
      user: UserModel.fromJson(user),
      title: title,
      content: content,
      image: image,
      date: date,
      likes: likes,
    );
  }
}
