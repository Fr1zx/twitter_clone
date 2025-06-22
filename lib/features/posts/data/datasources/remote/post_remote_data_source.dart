import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frizter/core/services/user_service.dart';
import 'package:frizter/core/utils/date_formatter.dart';
import 'package:frizter/features/posts/data/models/post_model.dart';
import 'package:frizter/features/posts/data/models/posts_loaded_model.dart';
import 'package:frizter/features/posts/domain/usecases/make_post_use_case.dart';

abstract interface class PostRemoteDataSource {
  Future<PostsLoadedModel> getAllPosts();
  Future<void> makePost(PostParams params);
  Future<void> likeOrUnlike(String postId);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  final IUserService userService;
  PostRemoteDataSourceImpl({
    required this.firebaseFirestore,
    required this.firebaseStorage,
    required this.userService,
  });

  String get uid => userService.uid;
  @override
  Future<PostsLoadedModel> getAllPosts() async {
    final posts =
        await firebaseFirestore
            .collection("posts")
            .orderBy("date", descending: true)
            .get();
    final outputPosts =
        posts.docs.map((e) => PostModel.fromJson(e.data())).toList();
    return PostsLoadedModel(
      posts:
          outputPosts
              .map(
                (post) => post.copyWith(
                  date: DateFormatter.formatDateFromString(post.date),
                ),
              )
              .toList(),
      uid: uid,
    );
  }

  @override
  Future<void> likeOrUnlike(String postId) async {
    final likesCollection = firebaseFirestore.collection("posts");
    final likes = await likesCollection.doc(postId).get();
    if (PostModel.fromJson(likes.data()!).likes.contains(uid)) {
      likesCollection.doc(postId).update({
        "likes": List.from(PostModel.fromJson(likes.data()!).likes)
          ..removeWhere((id) => id == uid),
      });
    } else {
      likesCollection.doc(postId).update({
        "likes": List.from(PostModel.fromJson(likes.data()!).likes)..add(uid),
      });
    }
  }

  @override
  Future<void> makePost(PostParams params) async {
    final user = await userService.getUserData(uid);
    final userJson = user.toJson();
    final imgRef = firebaseStorage.ref("/images/$uid/${DateTime.now()}}");
    String? imageUrl;
    if (params.image != null) {
      await imgRef.putFile(File(params.image!));
      imageUrl = await imgRef.getDownloadURL();
    }

    final post = await firebaseFirestore
        .collection("posts")
        .add(
          PostModel(
            postId: "",
            user: userJson,
            title: params.title,
            content: params.content,
            image: imageUrl,
            date: DateTime.now().toString(),
            likes: [],
          ).toJson(),
        );
    return await post.update({"postId": post.id});
  }
}
