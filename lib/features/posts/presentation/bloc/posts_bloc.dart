import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/posts/domain/entities/posts_loaded_entity/posts_loaded_entity.dart';
import 'package:frizter/features/posts/domain/usecases/get_all_posts_use_case.dart';
import 'package:frizter/features/posts/domain/usecases/like_or_unlike_use_case.dart';
import 'package:frizter/features/posts/domain/usecases/make_post_use_case.dart';

part 'posts_event.dart';
part 'posts_state.dart';
part 'posts_bloc.freezed.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  final MakePostUseCase makePostUseCase;
  final LikeOrUnlikeUseCase likeOrUnlikeUseCase;
  PostsBloc({
    required this.getAllPostsUseCase,
    required this.makePostUseCase,
    required this.likeOrUnlikeUseCase,
  }) : super(PostsState.initial()) {
    on<_LoadPosts>((event, emit) async {
      if (state is! _Loaded) emit(PostsState.loading());
      final postsOrFailure = await getAllPostsUseCase.call(NoParams());
      postsOrFailure.fold(
        (error) => emit(PostsState.failure(error: error.message)),
        (posts) {
          emit(PostsState.loaded(postsEntity: posts));
        },
      );
    });
    on<_MakePost>((event, emit) async {
      emit(PostsState.loading());
      final makePostOrFailure = await makePostUseCase.call(event.params);
      makePostOrFailure.fold(
        (error) => emit(PostsState.failure(error: error.message)),
        (_) {
          add(PostsEvent.loadPosts());
        },
      );
    });
    on<_LikeOrUnlikePost>((event, emit) async {
      final currentState = state;
      if (currentState is _Loaded) {
        final result = await likeOrUnlikeUseCase.call(event.postId);
        result.fold((error) => emit(PostsState.failure(error: error.message)), (
          _,
        ) {
          final updatedPosts =
              currentState.postsEntity.posts.map((post) {
                if (post.postId == event.postId) {
                  return post.copyWith(
                    likes:
                        post.likes.contains(currentState.postsEntity.uid)
                            ? post.likes
                                .where(
                                  (uid) => uid != currentState.postsEntity.uid,
                                )
                                .toList()
                            : [...post.likes, currentState.postsEntity.uid],
                  );
                }
                return post;
              }).toList();

          emit(
            PostsState.loaded(
              postsEntity: currentState.postsEntity.copyWith(
                posts: updatedPosts,
              ),
            ),
          );
        });
      }
    });
  }
}
