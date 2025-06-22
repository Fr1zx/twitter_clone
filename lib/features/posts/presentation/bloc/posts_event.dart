part of 'posts_bloc.dart';

@freezed
class PostsEvent with _$PostsEvent {
  const factory PostsEvent.loadPosts() = _LoadPosts;
  const factory PostsEvent.makePost({required PostParams params}) = _MakePost;
  const factory PostsEvent.likeOrUnlikePost(String postId) = _LikeOrUnlikePost;
}
