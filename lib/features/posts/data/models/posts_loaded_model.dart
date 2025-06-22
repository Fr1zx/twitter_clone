import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/features/posts/data/models/post_model.dart';
import 'package:frizter/features/posts/domain/entities/posts_loaded_entity/posts_loaded_entity.dart';

part 'posts_loaded_model.freezed.dart';

@freezed
class PostsLoadedModel with _$PostsLoadedModel {
  factory PostsLoadedModel({
    required String uid,
    required List<PostModel> posts,
  }) = _PostsLoadedModel;

  const PostsLoadedModel._();

  PostsLoadedEntity toEntity() {
    final postsEntity = posts.map((postModel) => postModel.toEntity()).toList();
    return PostsLoadedEntity(posts: postsEntity, uid: uid);
  }
}
