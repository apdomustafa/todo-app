import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app2/features/login_create_feature/model/repos/register_repo/register_account_repo.dart';
import 'package:todo_app2/core/helpers/failures.dart';

class RegisterWithUserNameAndPass extends RegisterAccountRepo {
  String userName, pass;
  RegisterWithUserNameAndPass({required this.userName, required this.pass});
  @override
  Future<Either<Failure, UserCredential>> registerAccount() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '$userName@gmail.com',
        password: pass,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }
}
