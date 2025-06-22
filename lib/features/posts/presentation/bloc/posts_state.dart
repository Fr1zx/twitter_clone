part of 'posts_bloc.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = _Initial;
  const factory PostsState.loading() = _Loading;
  const factory PostsState.loaded({required PostsLoadedEntity postsEntity}) =
      _Loaded;
  const factory PostsState.failure({required String error}) = _Failure;
}
