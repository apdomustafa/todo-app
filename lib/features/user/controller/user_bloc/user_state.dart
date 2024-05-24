part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserDateLoading extends UserState {}

final class UserDateDissmisLoading extends UserState {}

final class UserSignOutSuccessfully extends UserState {}

final class UserImageUpdateSuccessfully extends UserState {
  final Uint8List? image;
  UserImageUpdateSuccessfully({required this.image});
}

final class UserNameUpdateSuccessfully extends UserState {
  final String? name;
  UserNameUpdateSuccessfully({required this.name});
}

final class UserDataGettingSuccess extends UserState {
  final String? userName;
  final Uint8List? image;
  UserDataGettingSuccess({required this.image, required this.userName});
}
