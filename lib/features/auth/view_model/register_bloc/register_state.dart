part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterChageButtonColor extends RegisterState {}

final class RegisterFailuerState extends RegisterState {
  final String message;

  RegisterFailuerState({required this.message});
}

final class RegisterWithUsernameSuccessState extends RegisterState {}

final class RegisterWithGoogleSuccessState extends RegisterState {}
