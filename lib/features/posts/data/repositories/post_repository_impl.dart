import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/utils/errors_mapper.dart';
import 'package:frizter/features/posts/data/datasources/remote/post_remote_data_source.dart';
import 'package:frizter/features/posts/domain/entities/posts_loaded_entity/posts_loaded_entity.dart';
import 'package:frizter/features/posts/domain/repositories/posts_repository.dart';
import 'package:frizter/features/posts/domain/usecases/make_post_use_case.dart';

class PostRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl({required this.postRemoteDataSource});

  @override
  Future<Either<Failure, PostsLoadedEntity>> getAllPosts() async {
    try {
      final posts = await postRemoteDataSource.getAllPosts();
      return Right(posts.toEntity());
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> likeOrUnlike(String postId) async {
    try {
      return Right(await postRemoteDataSource.likeOrUnlike(postId));
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }

  @override
  Future<Either<Failure, void>> makePost(PostParams params) async {
    try {
      return Right(await postRemoteDataSource.makePost(params));
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }
}
