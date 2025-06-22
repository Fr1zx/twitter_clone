import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frizter/core/services/user_service.dart';
import 'package:frizter/features/posts/domain/entities/post_entity/post_entity.dart';
import 'package:frizter/features/search/domain/usecases/search_posts_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchPostsUseCase searchPostsUseCase;
  final IUserService userService;
  SearchBloc({
    required this.searchPostsUseCase,
    required this.userService,
  }) : super(SearchState.initial()) {
    on<_SearchPosts>((event, emit) async {
      emit(SearchState.loading());
      final postsOrFailure = await searchPostsUseCase.call(event.query);
      postsOrFailure.fold(
        (error) => emit(SearchState.failure(error: error.message)),
        (posts) => emit(SearchState.loaded(uid: userService.uid, posts: posts)),
      );
    });
  }
}
