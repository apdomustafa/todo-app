import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/helpers/methods/loading_dialog.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/user/controller/user_bloc/user_bloc.dart';
import 'package:todo_app2/features/user/model/data/user_info_storage.dart';
import 'package:todo_app2/features/user/views/widgets/number_of_task.dart';

class UserNameAndImageAndNumOfTasks extends StatefulWidget {
  const UserNameAndImageAndNumOfTasks({super.key});

  @override
  State<UserNameAndImageAndNumOfTasks> createState() =>
      _UserNameAndImageAndNumOfTasksState();
}

class _UserNameAndImageAndNumOfTasksState
    extends State<UserNameAndImageAndNumOfTasks> {
  String? userName;
  Uint8List? imageBytes;
  int numOfTasksDone = 0;
  int numOfTasksLeft = 0;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() {
    UserInfoStorage userInfo = UserInfoStorage();
    userName = userInfo.getUserName();
    imageBytes = userInfo.getUserImage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserDateLoading) {
          showLoadingDialog(context);
        } else if (state is UserNameUpdateSuccessfully) {
          userName = state.name;
        } else if (state is UserImageUpdateSuccessfully) {
          imageBytes = state.image;
        } else if (state is UserDataGettingSuccess) {
          userName = state.userName;
          imageBytes = state.image;
          numOfTasksLeft = state.numOftasksLeft;
          numOfTasksDone = state.numOfTasksDone;
        } else if (state is UserDateDissmisLoading) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox(
                width: 140.w,
                height: 140.w,
                child: imageBytes == null
                    ? Image.asset(Assets.imageUserProfile)
                    : Image.memory(
                        imageBytes!,
                      ),
              ),
            ),
            Gap(10.h),
            Text(
              userName ?? 'userName',
              style: AppStyles.styleLatoMeduim20(context),
            ),
            Gap(20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child:
                        NumberOfTasks(text: '$numOfTasksLeft  of tasks left'),
                  ),
                  const Gap(20),
                  Expanded(
                    child: NumberOfTasks(text: '$numOfTasksDone of tasks done'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
