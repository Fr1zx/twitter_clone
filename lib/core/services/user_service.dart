import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frizter/core/models/user_model.dart';

abstract interface class IUserService {
  String get uid;
  Stream<bool> isLogined();
  Future<UserModel> getUserData(String uid);
}

class UserService implements IUserService {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  UserService({required this.firebaseAuth, required this.firebaseFirestore});

  @override
  Future<UserModel> getUserData(String uid) async {
    final user = await firebaseFirestore.collection("users").doc(uid).get();
    return UserModel.fromJson(user.data()!);
  }

  @override
  Stream<bool> isLogined() {
    return firebaseAuth.authStateChanges().map((user) => user != null);
  }

  @override
  String get uid => firebaseAuth.currentUser!.uid;
}
