part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserDateLoading extends UserState {}

final class UserDateDissmisLoading extends UserState {}

final class UserSignOutSuccessfully extends UserState {}

final class UserError extends UserState {
  final String errorMessage;
  UserError({required this.errorMessage});
}

final class UserDataGettingSuccess extends UserState {
  final String? userName;
  final Uint8List? image;
  final int numOftasksLeft;
  final int numOfTasksDone;
  UserDataGettingSuccess(
      {required this.image,
      required this.userName,
      required this.numOftasksLeft,
      required this.numOfTasksDone});
}

final class UserImageUpdateSuccessfully extends UserState {
  final Uint8List? image;
  UserImageUpdateSuccessfully({required this.image});
}

final class UserNameUpdateSuccessfully extends UserState {
  final String? name;
  UserNameUpdateSuccessfully({required this.name});
}

final class PassUpdateSuccessfully extends UserState {}
