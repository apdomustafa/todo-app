import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app2/core/helpers/methods/app_user_info.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/auth/views/login_view.dart';
import 'package:todo_app2/features/user/controller/user_bloc/user_bloc.dart';
import 'package:todo_app2/features/user/views/helper_method/change_account_image.dart';
import 'package:todo_app2/features/user/views/helper_method/change_account_name.dart';
import 'package:todo_app2/features/user/views/helper_method/change_account_pass.dart';
import 'package:todo_app2/features/user/views/widgets/number_of_task.dart';
import 'package:todo_app2/features/user/views/widgets/profile_item.dart';
import 'dart:math' as math;

import 'package:todo_app2/features/user/views/widgets/user_name_image.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    bool? isUserDateInfoNotInit = await AppUserInfo.isUserDateInfoNotInit();
    if (isUserDateInfoNotInit == true) {
      BlocProvider.of<UserBloc>(context).add(ServerUserDateNeeded());
      AppUserInfo.updateUserDataInfo(false);
    } else {
      BlocProvider.of<UserBloc>(context).add(LocalUserDateNeeded());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserSignOutSuccessfully) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginView()));
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Text(
                'Profile',
                style: AppStyles.styleLatoReguler20(context),
              ),
              Gap(24.h),
              const UserNameAndImage(),
              Gap(20.h),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: NumberOfTasks(text: '10 of tasks left'),
                    ),
                    Gap(20),
                    Expanded(
                      child: NumberOfTasks(text: '5 of tasks done'),
                    ),
                  ],
                ),
              ),
              Gap(32.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Settings',
                      style: AppStyles.styleLatoReguler14(context),
                    ),
                  ),
                  ProfileItem(
                    onTap: () {},
                    title: 'App Settings',
                    iconDate: Icons.settings,
                  ),
                  Gap(16.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Account',
                      style: AppStyles.styleLatoReguler14(context),
                    ),
                  ),
                  ProfileItem(
                    onTap: () {
                      changeAccountName(context: context);
                    },
                    title: 'Change account name',
                    iconDate: Icons.person,
                  ),
                  ProfileItem(
                    onTap: () {
                      changeAccountPass(context: context);
                    },
                    title: 'Change account password',
                    iconDate: Icons.key,
                  ),
                  ProfileItem(
                    onTap: () {
                      changeAccountImage(context: context);
                    },
                    title: 'Change account Image',
                    iconDate: Icons.image,
                  ),
                  Gap(16.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Uptodo',
                      style: AppStyles.styleLatoReguler14(context),
                    ),
                  ),
                  ProfileItem(
                    onTap: () {},
                    title: 'About US',
                    iconDate: Icons.menu,
                  ),
                  ProfileItem(
                    onTap: () {},
                    title: 'Help & Feedback',
                    iconDate: Icons.flash_on,
                  ),
                  ProfileItem(
                    onTap: () {},
                    title: 'Support US',
                    iconDate: Icons.thumb_up_alt_outlined,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: InkWell(
                      onTap: () async {
                        BlocProvider.of<UserBloc>(context).add(UserSignedOut());
                      },
                      child: Row(
                        children: [
                          Transform.rotate(
                            angle: math.pi,
                            child: const Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                          Gap(10.w),
                          Text(
                            'Log out',
                            style: AppStyles.styleLatoReguler16(context)
                                .copyWith(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
