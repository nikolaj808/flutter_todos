import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todos/exceptions/email_already_in_use_error.dart';
import 'package:flutter_todos/exceptions/user_not_found_error.dart';
import 'package:flutter_todos/exceptions/weak_password_error.dart';
import 'package:flutter_todos/exceptions/wrong_password_error.dart';

class AuthenticationRepository {
  const AuthenticationRepository();

  Future<UserCredential> registerUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'weak-password':
          throw const WeakPasswordError();
        case 'email-already-in-use':
          throw const EmailAlreadyInUseError();
        default:
          rethrow;
      }
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          throw const UserNotFoundError();
        case 'wrong-password':
          throw const WrongPasswordError();
        default:
          rethrow;
      }
    }
  }
}
