import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/core/helpers/constants.dart';
import 'package:todo_app2/core/helpers/failures.dart';
import 'package:todo_app2/features/login_create_feature/model/repos/login_repo.dart/Login_repo.dart';

class LoginWithGoogle extends LoginRepo {
  @override
  Future<Either<Failure, UserCredential>> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kUserSignin, true);

      // Once signed in, return the UserCredential
      return right(
          await FirebaseAuth.instance.signInWithCredential(credential));
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }
}
