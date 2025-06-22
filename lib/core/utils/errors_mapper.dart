import 'package:firebase_auth/firebase_auth.dart';
import 'package:frizter/core/errors/failures.dart';

class ErrorsMapper {
  ErrorsMapper._();

  static Failure handleError(Object error) {
    if (error is FirebaseAuthException) {
      return _handleFirebaseAuthError(error);
    }
    return UnkownFailure(
      message:
          "Something went wrong. Please try again later or contact support",
    );
  }

  static Failure _handleFirebaseAuthError(FirebaseAuthException exception) {
    switch (exception.code) {
      case "invalid-email":
        return AuthFailure(
          message:
              "This email is not valid. The email format you entered is invalid",
        );
      case "weak-password":
        return AuthFailure(message: "This password is too weak");
      case "email-already-in-use":
        return AuthFailure(
          message: "This email is already in use. Please use another email",
        );
      case "wrong-password":
        return AuthFailure(message: "The password you entered is incorrect");
      case "too-many-requests":
        return AuthFailure(message: "Too many requests. Try again later");
      case "requires-recent-login" || "user-token-expired":
        return AuthFailure(
          message: "Please login in again to perform this operation",
        );

      case "unknown-error":
        return AuthFailure(message: "The data you entered is incorrect");

      default:
        return AuthFailure(message: "Authentication error");
    }
  }
}
