import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.message});
  factory FirebaseFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return FirebaseFailure(message: 'The password provided is too weak.');
      case 'email-already-in-use':
        return FirebaseFailure(message: 'Username already exists.');
      case 'invalid-email':
        return FirebaseFailure(message: 'Please enter a valid username.');
      case 'invalid-credential':
        return FirebaseFailure(message: 'Invalid credential.');
      case 'account-exists-with-different-credential':
        return FirebaseFailure(
            message: 'Account exists with different credential.');
      case 'user-not-found':
        return FirebaseFailure(message: 'user not found');
      case 'wrong-password':
        return FirebaseFailure(message: 'wrong password');

      default:
        return FirebaseFailure(message: 'Error: ${e.message}');
    }
  }
}
