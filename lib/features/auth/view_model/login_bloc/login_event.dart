part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class LoginChangeButtonColorEvent extends LoginEvent {}

class LoginWithEmailAndPassEvent extends LoginEvent {
  final String userName, pass;

  LoginWithEmailAndPassEvent({required this.userName, required this.pass});
}

class LoginWithGoogleEvent extends LoginEvent {}
