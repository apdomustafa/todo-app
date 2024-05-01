import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app2/core/helpers/failures.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserCredential>> login();
}
