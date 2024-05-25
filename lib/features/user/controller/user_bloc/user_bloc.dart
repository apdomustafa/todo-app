import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
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
      File? imageFile = await AppImagePicker.pickImageFromGallary();
      if (imageFile != null) {
        firebaseService.saveUserImage(imageFile);
        userInfo.saveUserImage(await imageFile.readAsBytes());
        emit(UserDateDissmisLoading());
        emit(UserImageUpdateSuccessfully(image: await imageFile.readAsBytes()));
      }
    });

    on<PasswordChanged>((event, emit) async {
      emit(UserDateLoading());
      var result =
          await firebaseService.updatePass(event.currentPass, event.newPass);
      emit(UserDateDissmisLoading());
      result.fold((failure) {
        emit(UserError(errorMessage: failure.message));
      }, (success) {
        emit(PassUpdateSuccessfully());
      });
    });

    on<UserNameChanged>((event, emit) async {
      emit(UserDateLoading());
      firebaseService.setUserName(event.userName);
      userInfo.saveUserName(event.userName);
      emit(UserDateDissmisLoading());
      emit(UserNameUpdateSuccessfully(name: event.userName));
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
