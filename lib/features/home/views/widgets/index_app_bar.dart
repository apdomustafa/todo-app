import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/widgets/filter_tasks.dart';

class IndexAppBar extends StatefulWidget {
  const IndexAppBar({super.key});

  @override
  State<IndexAppBar> createState() => _IndexAppBarState();
}

class _IndexAppBarState extends State<IndexAppBar> {
  Uint8List? imageBytes;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskManagementBloc, TaskManagementState>(
        listener: (BuildContext context, TaskManagementState state) {
          if (state is UserImageGettingSuccessState) {
            imageBytes = state.userImage;
          }
        },
        buildWhen: (previous, current) =>
            current != previous && current is UserImageGettingSuccessState,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FilterTasks(),
              Text(
                'Index',
                style: AppStyles.styleLatoReguler20(context),
              ),
              ClipOval(
                child: SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: imageBytes == null
                      ? Icon(
                          Icons.person,
                          size: 40.r,
                        )
                      : Image.memory(
                          imageBytes!,
                        ),
                ),
              ),
            ],
          );
        });
  }
}
