part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class ServerUserDateNeeded implements UserEvent {}

class LocalUserDateNeeded implements UserEvent {}

class NumberAllTasksNeeded implements UserEvent {}

class UserImageChanged implements UserEvent {
  TypeImagePicker typeImagePicker;
  UserImageChanged({required this.typeImagePicker});
}

class UserSignedOut implements UserEvent {}

class UserNameChanged implements UserEvent {
  final String userName;
  UserNameChanged(this.userName);
}

class PasswordChanged implements UserEvent {
  final String currentPass, newPass;
  PasswordChanged({required this.currentPass, required this.newPass});
}
