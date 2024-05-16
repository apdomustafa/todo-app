import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/core/widgets/custom_button.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/helper_method/date_picker.dart';
import 'package:todo_app2/features/home/views/helper_method/edit_category.dart';
import 'package:todo_app2/features/home/views/helper_method/edit_task_title.dart';
import 'package:todo_app2/features/home/views/helper_method/priority_picker.dart';
import 'package:todo_app2/features/home/views/helper_method/time_picker.dart';
import 'package:todo_app2/features/home/views/widgets/editing_task_item.dart';
import 'package:todo_app2/features/home/views/widgets/title_description_editing.dart';

class TaskEditingView extends StatefulWidget {
  const TaskEditingView({super.key, required this.task, required this.index});
  final TaskModule task;
  final int index;

  @override
  State<TaskEditingView> createState() => _TaskEditingViewState();
}

class _TaskEditingViewState extends State<TaskEditingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            // app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.close))),
                Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.repeat))),
              ],
            ),
            const Gap(37),
            TitleAndDescriptionEdit(
              task: widget.task,
              edit: () {
                editTaskTitle(context, widget.task)
                    .then((value) => {setState(() {})});
              },
            ),
            const Gap(46),
            Expanded(
              child: ListView(
                children: [
                  TaskEditingItem(
                    icon: AppIcons.schedule,
                    text: 'Task Time',
                    categoryText: widget.task.getDateAndTime(),
                    edit: () async {
                      DateTime? date = await getDate(
                          context: context,
                          date: (date) {
                            widget.task.date = date;
                          });
                      if (date != null) {
                        await getTaskTime(
                          context: context,
                          time: (time) {
                            widget.task.time = time;
                          },
                        );
                      }
                      setState(() {});
                    },
                  ),
                  TaskEditingItem(
                      icon: AppIcons.tag,
                      text: 'Task Category',
                      categoryIconData: widget.task.category.iconCodePoint,
                      color: widget.task.category.color,
                      categoryText: widget.task.category.categoryName,
                      edit: () async {
                        await editCategory(
                            context: context,
                            getCategory: (category) {
                              widget.task.category = category;
                              Navigator.pop(context);
                              setState(() {});
                            });
                      }),
                  TaskEditingItem(
                    icon: AppIcons.bookMark,
                    text: 'Task Priority',
                    categoryText: widget.task.priority == 1
                        ? 'Defult'
                        : widget.task.priority.toString(),
                    edit: () async {
                      await getTaskPriority(
                          context: context,
                          getPriority: (int priority) {
                            setState(() {
                              widget.task.priority = priority;
                              Navigator.pop(context);
                            });
                          });
                    },
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        const Gap(10),
                        Text('Delete Task',
                            style:
                                AppStyles.styleLatoReguler16(context).copyWith(
                              color: Colors.red,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                    text: 'Edit Task',
                    onpress: () {
                      BlocProvider.of<TaskManagementBloc>(context)
                          .add(TaskUpdated(widget.task, index: widget.index));
                      Navigator.pop(context);
                    })),
          ],
        ),
      ),
    );
  }
}
