import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/core/helpers/constants.dart';
import 'package:todo_app2/core/helpers/failures.dart';
import 'package:todo_app2/features/auth/model/repos/login_repo.dart/Login_repo.dart';

class LoginWithEmailAndPass extends LoginRepo {
  final String email, pass;

  LoginWithEmailAndPass({required this.email, required this.pass});
  @override
  Future<Either<Failure, UserCredential>> login() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kUserSignin, true);
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromFirebaseAuthException(e));
    }
  }
}
