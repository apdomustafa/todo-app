import 'package:flutter/material.dart';
import 'package:todo_app2/features/home/views/widgets/priority_picker_item.dart';

class PriorityPickerItems extends StatefulWidget {
  const PriorityPickerItems({super.key});

  @override
  State<PriorityPickerItems> createState() => _PriorityPickerItemsState();
}

class _PriorityPickerItemsState extends State<PriorityPickerItems> {
  int itemSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        height: 224,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 16, crossAxisSpacing: 16),
          children: List.generate(10, (index) {
            index++;
            return InkWell(
              onTap: () {
                setState(() {
                  itemSelected = index;
                });
              },
              child: PriorityPickerItem(
                  priorityNum: index, isSelected: itemSelected == index),
            );
          }),
        ),
      ),
    );
  }
}
