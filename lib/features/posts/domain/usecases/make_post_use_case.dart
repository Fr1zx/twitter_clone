import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/posts/domain/repositories/posts_repository.dart';

class MakePostUseCase extends UseCase<void, PostParams> {
  final PostsRepository postsRepository;

  MakePostUseCase({required this.postsRepository});
  @override
  Future<Either<Failure, void>> call(PostParams params) {
    return postsRepository.makePost(params);
  }
}

class PostParams {
  final String title;
  final String content;
  final String? image;
  PostParams({required this.title, required this.content, required this.image});
}
