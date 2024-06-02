import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/helpers/enums.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/user/controller/user_bloc/user_bloc.dart';

void changeAccountImage({required BuildContext context}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: FittedBox(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Change account Image',
                    style: AppStyles.styleLatoBold16(context),
                  ),
                ),
              ),
              Gap(10.h),
              const Divider(),
              Gap(28.h),
              InkWell(
                onTap: () {
                  BlocProvider.of<UserBloc>(context).add(UserImageChanged(
                      typeImagePicker: TypeImagePicker.camera));
                  Navigator.pop(context);
                },
                child: Text(
                  'Tack picture',
                  style: AppStyles.styleLatoReguler16(context),
                ),
              ),
              Gap(28.h),
              InkWell(
                onTap: () {
                  BlocProvider.of<UserBloc>(context).add(UserImageChanged(
                      typeImagePicker: TypeImagePicker.gallery));
                  Navigator.pop(context);
                },
                child: Text(
                  'Import from gallery',
                  style: AppStyles.styleLatoReguler16(context),
                ),
              ),
              Gap(28.h),
              InkWell(
                onTap: () {},
                child: Text(
                  'Import from Google Drive',
                  style: AppStyles.styleLatoReguler16(context),
                ),
              ),
              Gap(28.h),
            ],
          ),
        );
      });
}
