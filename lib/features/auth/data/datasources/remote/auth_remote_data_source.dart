import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frizter/core/models/user_model.dart';
import 'package:frizter/core/services/user_service.dart';
import 'package:frizter/core/utils/date_formatter.dart';
import 'package:frizter/features/auth/domain/usecases/login_use_case.dart';
import 'package:frizter/features/auth/domain/usecases/register_use_case.dart';

abstract interface class AuthRemoteDataSource {
  Future<void> login(LoginParams params);
  Future<void> register(RegisterParams params);
  Future<void> resetPassword(String email);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final IUserService userService;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  AuthRemoteDataSourceImpl({
    required this.userService,
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<void> login(LoginParams params) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }

  @override
  Future<void> register(RegisterParams params) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    await firebaseFirestore
        .collection("users")
        .doc(userService.uid)
        .set(
          UserModel(
            username: params.username,
            email: params.email,
            userPhoto:
                "https://sbcf.fr/wp-content/uploads/2018/03/sbcf-default-avatar.png",
            bio: "",
            creationDate: DateFormatter.formatDate(DateTime.now()),
          ).toJson(),
        );
  }

  @override
  Future<void> resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
