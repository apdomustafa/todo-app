part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class ServerUserDateNeeded implements UserEvent {}

class LocalUserDateNeeded implements UserEvent {}

class UserImageChanged implements UserEvent {}

class UserSignedOut implements UserEvent {}

class UserNameChanged implements UserEvent {
  final String userName;
  UserNameChanged(this.userName);
}
