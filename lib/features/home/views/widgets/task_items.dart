import 'package:flutter/cupertino.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/features/home/views/widgets/task_item.dart';

class TaskItems extends StatefulWidget {
  const TaskItems(
      {super.key,
      required this.items,
      required this.onRadioSelected,
      required this.onItemRemoved});
  final List<TaskModule> items;
  final void Function(int index) onRadioSelected, onItemRemoved;

  @override
  State<TaskItems> createState() => _TaskItemsState();
}

class _TaskItemsState extends State<TaskItems> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return TaskItem(
              item: widget.items[index],
              index: index,
              onRadioSelected: widget.onRadioSelected,
              onItemRemoved: widget.onItemRemoved,
            );
          }),
    );
  }
}
