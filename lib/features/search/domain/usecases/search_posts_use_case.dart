import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/posts/domain/entities/post_entity/post_entity.dart';
import 'package:frizter/features/search/domain/repositories/search_repository.dart';

class SearchPostsUseCase extends UseCase<List<PostEntity>, String> {
  final SearchRepository searchRepository;

  SearchPostsUseCase({required this.searchRepository});
  @override
  Future<Either<Failure, List<PostEntity>>> call(String params) {
    return searchRepository.searchPost(params);
  }
}
