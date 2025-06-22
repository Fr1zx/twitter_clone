import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/features/posts/domain/entities/posts_loaded_entity/posts_loaded_entity.dart';
import 'package:frizter/features/posts/domain/usecases/make_post_use_case.dart';

abstract interface class PostsRepository {
  Future<Either<Failure, PostsLoadedEntity>> getAllPosts();
  Future<Either<Failure, void>> makePost(PostParams params);
  Future<Either<Failure, void>> likeOrUnlike(String postId);
}
