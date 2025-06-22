import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/posts/domain/repositories/posts_repository.dart';

class LikeOrUnlikeUseCase extends UseCase<void, String> {
  final PostsRepository postsRepository;

  LikeOrUnlikeUseCase({required this.postsRepository});
  @override
  Future<Either<Failure, void>> call(String postId) {
    return postsRepository.likeOrUnlike(postId);
  }
}
