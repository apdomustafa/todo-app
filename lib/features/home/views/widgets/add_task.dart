import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/widgets/add_description_text_field.dart';
import 'package:todo_app2/features/home/views/widgets/add_task_bottom_part.dart';
import 'package:todo_app2/features/home/views/widgets/add_title_text_field.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  GlobalKey<FormState> titleTextFieldKey = GlobalKey<FormState>();
  GlobalKey<FormState> descriptiontextFieldKey = GlobalKey<FormState>();
  FocusNode descriptionNode = FocusNode();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        decoration: const BoxDecoration(
          color: AppColors.secondryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.start,
              style: AppStyles.styleLatoBold20(context).copyWith(
                color: Colors.white.withOpacity(0.87),
              ),
            ),
            const Gap(14),
            AddTitleTextField(
              hint: 'Title',
              controller: titleController,
              globalKey: titleTextFieldKey,
              descriptionNode: descriptionNode,
            ),
            const Gap(14),
            AddDescriptionTextField(
              hint: 'Description',
              controller: descriptionController,
              globalKey: descriptiontextFieldKey,
              focusNode: descriptionNode,
            ),
            const Gap(35),
            AddTaskBottomPart(
              savetask: () {
                _saveTask(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _saveTask(BuildContext context) {
    if (titleTextFieldKey.currentState!.validate() &&
        descriptiontextFieldKey.currentState!.validate()) {
      getIt<TaskModule>().title = titleController.text;
      getIt<TaskModule>().description = descriptionController.text;
      TaskModule task = TaskModule.copy(getIt<TaskModule>());
      task.category = CategoryModule.copy(getIt<CategoryModule>());
      BlocProvider.of<TaskManagementBloc>(context).add(TaskAdd(task));
      titleController.clear();
      descriptionController.clear();
      getIt<TaskModule>().taskClear();
    }
  }
}
