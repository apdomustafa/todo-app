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
        return FirebaseFailure(message: 'email already exists.');
      case 'invalid-email':
        return FirebaseFailure(message: 'enter a valid email.');
      case 'wrong-password':
        return FirebaseFailure(message: 'wrong password');
      case 'invalid-credential':
        return FirebaseFailure(message: 'Invalid credential.');
      case 'account-exists-with-different-credential':
        return FirebaseFailure(
            message: 'Account exists with different credential.');
      case 'user-mismatch':
        return FirebaseFailure(message: 'user mismatch');
      case 'user-not-found':
        return FirebaseFailure(message: 'user not found');

      default:
        return FirebaseFailure(message: 'Error: ${e.message}');
    }
  }
}
