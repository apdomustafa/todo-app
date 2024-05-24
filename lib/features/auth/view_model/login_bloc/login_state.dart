part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginChageButtonColor extends LoginState {}

final class LoginFaluireState extends LoginState {
  final String message;

  LoginFaluireState({required this.message});
}

final class LoginSuccessState extends LoginState {}

final class LoginLoadingState extends LoginState {}
