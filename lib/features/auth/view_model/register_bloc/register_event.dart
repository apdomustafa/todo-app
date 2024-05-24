part of 'register_bloc.dart';

sealed class RegisterEvent {}

class RegisterInitialEvent extends RegisterEvent {}

class RegisterButtonColorChanged extends RegisterEvent {}

final class RegisterWithUsernameAndPassSelected extends RegisterEvent {
  final String userName, email, pass;

  RegisterWithUsernameAndPassSelected(
      {required this.userName, required this.email, required this.pass});
}

final class RegisterWithGoogleSelected extends RegisterEvent {}
