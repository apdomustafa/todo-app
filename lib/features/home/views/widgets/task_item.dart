import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app2/core/helpers/navigation.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/core/widgets/alert_dialog.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/edit_task_view.dart';
import 'package:todo_app2/features/home/views/helper_method/get_color.dart';

class TaskItem extends StatefulWidget {
  const TaskItem(
      {super.key,
      required this.item,
      required this.index,
      required this.onRadioSelected,
      required this.onItemRemoved});
  final TaskModule item;
  final int index;
  final void Function(int index) onRadioSelected, onItemRemoved;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final bool _isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigation.navigateTO(
            TaskEditingView(
              task: TaskModule.copy(widget.item),
              index: widget.index,
            ),
            context);
      },
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          showAlertDialolg(context, onDelete: () {
            widget.onItemRemoved(widget.index);
          }, onCancel: () {
            setState(() {
              Navigator.pop(context);
            });
          });
        },
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          child: const Icon(Icons.delete),
        ),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: AppColors.secondryColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 30,
                child: RadioListTile(
                    value: true,
                    groupValue: _isCompleted,
                    onChanged: (value) {
                      widget.onRadioSelected(widget.index);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.title!,
                      style: AppStyles.styleLatoReguler16(context),
                    ),
                    Text(
                      widget.item.getDateAndTime(),
                      style: AppStyles.styleLatoReguler14(context).copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              widget.item.category.categoryName == null
                  ? const SizedBox()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Container(
                            height: 29,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color:
                                  getLighterColor(widget.item.category.color!),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(
                                    IconData(
                                        widget.item.category.iconCodePoint!,
                                        fontFamily:
                                            'MaterialIcons'), // Icon point value for "home" icon

                                    color: getDarkerColor(
                                        widget.item.category.color!),
                                  ),
                                  Text(
                                    widget.item.category.categoryName!,
                                    style: AppStyles.styleLatoReguler12(context)
                                        .copyWith(
                                      color: AppColors.labelColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 29,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: AppColors.secondryColor,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: AppColors.primaryColor),
                            ),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.bookmark,
                                  size: 20,
                                ),
                                Text(widget.item.priority.toString()),
                              ],
                            )),
                          )
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
