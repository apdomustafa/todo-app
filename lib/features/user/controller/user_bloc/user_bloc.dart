import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:todo_app2/core/helpers/methods/app_user_info.dart';
import 'package:todo_app2/core/services/app_picker_image.dart';
import 'package:todo_app2/core/services/network/firebase.dart';
import 'package:todo_app2/features/user/model/data/user_info_storage.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  FirebaseService firebaseService = FirebaseService();
  UserInfoStorage userInfo = UserInfoStorage();
  UserBloc() : super(UserInitial()) {
    on<ServerUserDateNeeded>((event, emit) async {
      emit(UserDateLoading());
      String userName = await firebaseService.getUserName();
      AppUserInfo.saveUserName(userName);
      // emit(UserDataGettingSuccess(userName: userName));
    });

    on<LocalUserDateNeeded>((event, emit) async {
      emit(UserDateLoading());
      String? userName = userInfo.getUserName();
      Uint8List? imageBytes = userInfo.getUserImage();
      emit(UserDateDissmisLoading());
      emit(UserDataGettingSuccess(userName: userName, image: imageBytes));
    });

    on<UserImageChanged>((event, emit) async {
      emit(UserDateLoading());
      Uint8List? imageBytes = await AppImagePicker.pickImageFromGallary();
      emit(UserDateDissmisLoading());
      if (imageBytes != null) {
        userInfo.saveUserImage(imageBytes);
        emit(UserImageUpdateSuccessfully(image: imageBytes));
      }
    });

    on<UserNameChanged>((event, emit) async {
      emit(UserDateLoading());
      firebaseService.setUserName(event.userName);
      userInfo.saveUserName(event.userName);
      emit(UserDateDissmisLoading());
      emit(UserNameUpdateSuccessfully(name: event.userName));

      // emit(UserDataGettingSuccess(userName: event.userName, image: _image!));
    });

    on<UserSignedOut>((event, emit) async {
      emit(UserDateLoading());
      firebaseService.logOut();
      AppUserInfo.logOut();
      AppUserInfo.updateUserDataInfo(true);
      AppUserInfo.update(userFirstTime: true);
      emit(UserSignOutSuccessfully());
    });
  }
}
