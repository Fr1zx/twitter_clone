import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frizter/core/utils/date_formatter.dart';
import 'package:frizter/features/posts/data/models/post_model.dart';

abstract interface class SearchRemoteDataSource {
  Future<List<PostModel>> searchPosts(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  SearchRemoteDataSourceImpl({required this.firebaseFirestore});
  @override
  Future<List<PostModel>> searchPosts(String query) async {
    final posts = await firebaseFirestore.collection("posts").get();
    final outputPosts = posts.docs.map(
      (post) => PostModel.fromJson(post.data()),
    );
    final filtredPosts =
        outputPosts
            .where(
              (post) =>
                  post.content.toLowerCase().contains(query.toLowerCase()) ||
                  post.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    return filtredPosts
        .map(
          (post) => post.copyWith(
            date: DateFormatter.formatDateFromString(post.date),
          ),
        )
        .toList();
  }
}
