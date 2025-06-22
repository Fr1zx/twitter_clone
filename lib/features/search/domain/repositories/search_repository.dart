import 'package:dartz/dartz.dart';
import 'package:frizter/core/errors/failures.dart';
import 'package:frizter/features/posts/domain/entities/post_entity/post_entity.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, List<PostEntity>>> searchPost(String query);
}