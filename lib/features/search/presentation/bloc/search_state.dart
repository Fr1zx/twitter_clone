part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded({
    required String uid,
    required List<PostEntity> posts,
  }) = _Loaded;
  const factory SearchState.failure({required String error}) = _Failure;
}
