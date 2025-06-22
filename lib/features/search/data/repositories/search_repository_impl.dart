import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/core/utils/errors_mapper.dart';
import 'package:frizter/features/posts/domain/entities/post_entity/post_entity.dart';
import 'package:frizter/features/search/data/datasources/remote/search_remote_data_source.dart';
import 'package:frizter/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepositoryImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<PostEntity>>> searchPost(String query) async {
    try {
      final posts = await searchRemoteDataSource.searchPosts(query);
      return Right(posts.map((post) => post.toEntity()).toList());
    } catch (e) {
      debugPrint("Error: $e");
      return Left(ErrorsMapper.handleError(e));
    }
  }
}
