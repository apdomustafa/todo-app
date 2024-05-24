import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app2/features/auth/model/repos/register_repo/register_account_repo.dart';
import 'package:todo_app2/core/helpers/failures.dart';

class RegisterWithUserNameAndPass extends RegisterAccountRepo {
  String userName, email, pass;
  RegisterWithUserNameAndPass(
      {required this.userName, required this.email, required this.pass});
  @override
  Future<Either<Failure, UserCredential>> registerAccount() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      _saveUserName(userName);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }

  void _saveUserName(String userName) {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection('tasks')
          .doc(user.uid)
          .set({'userName': userName});
    }
  }
}
