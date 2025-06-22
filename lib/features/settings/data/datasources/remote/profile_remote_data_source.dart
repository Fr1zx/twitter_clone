import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frizter/core/models/user_model.dart';
import 'package:frizter/core/services/user_service.dart';
import 'package:frizter/features/settings/domain/usecases/update_profile_use_case.dart';

abstract interface class ProfileRemoteDataSource {
  Future<UserModel> getUserInfo();
  Future<void> updateProfile(UpdateProfileParams params);
  Future<void> updateEmail(String newEmail);
  Future<void> updatePassword(String newPassword);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final IUserService userService;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  ProfileRemoteDataSourceImpl({
    required this.userService,
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });

  String get uid => userService.uid;

  @override
  Future<UserModel> getUserInfo() async {
    await firebaseAuth.currentUser!.reload();
    final user = await userService.getUserData(uid);
    final email = firebaseAuth.currentUser!.email;
    if (user.email != email) {
      return user.copyWith(email: "${user.email}(not confirmed)");
    } else {
      return user;
    }
  }

  @override
  Future<void> updateEmail(String newEmail) async {
    await firebaseAuth.currentUser!.verifyBeforeUpdateEmail(newEmail);
    await firebaseFirestore.collection("users").doc(uid).update({
      "email": newEmail,
    });
    await firebaseAuth.currentUser!.reload();
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    await firebaseAuth.currentUser!.updatePassword(newPassword);
    await firebaseAuth.currentUser!.reload();
  }

  @override
  Future<void> updateProfile(UpdateProfileParams params) async {
    if (params.newPhoto != null) {
      await firebaseStorage
          .ref("/avatars/$uid.png")
          .putFile(File(params.newPhoto!));
      final url =
          await firebaseStorage.ref("/avatars/$uid.png").getDownloadURL();
      await firebaseFirestore.collection("users").doc(uid).update({
        "username": params.username,
        "bio": params.bio,
        "userPhoto": url,
      });
    } else {
      await firebaseFirestore.collection("users").doc(uid).update({
        "username": params.username,
        "bio": params.bio,
      });
    }
  }
}
