import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/features/posts/domain/entities/post_entity/post_entity.dart';
part 'posts_loaded_entity.freezed.dart';

@freezed
class PostsLoadedEntity with _$PostsLoadedEntity {
  const factory PostsLoadedEntity({
    required List<PostEntity> posts,
    required String uid,
  }) = _PostsLoadedEntity;
}
