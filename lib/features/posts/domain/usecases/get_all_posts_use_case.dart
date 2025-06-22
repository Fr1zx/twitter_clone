import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/usecases/use_case.dart';
import 'package:frizter/features/posts/domain/entities/posts_loaded_entity/posts_loaded_entity.dart';
import 'package:frizter/features/posts/domain/repositories/posts_repository.dart';

class GetAllPostsUseCase extends UseCase<PostsLoadedEntity, NoParams> {
  final PostsRepository postsRepository;

  GetAllPostsUseCase({required this.postsRepository});
  @override
  Future<Either<Failure, PostsLoadedEntity>> call(NoParams params) {
    return postsRepository.getAllPosts();
  }
}
