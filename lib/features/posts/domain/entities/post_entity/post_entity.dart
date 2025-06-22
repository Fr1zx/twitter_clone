import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/core/models/user_model.dart';
part 'post_entity.freezed.dart';
@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required String postId,
    required UserModel user,
    required String title,
    required String content,
    required String? image,
    required String date,
    required List<String> likes,
  }) = _PostEntity;
}
