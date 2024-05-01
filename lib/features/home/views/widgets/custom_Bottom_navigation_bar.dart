import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/features/home/model/data/bottom_bar_item_model.dart';
import 'package:todo_app2/features/home/views/widgets/bottom_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onTapped});
  final void Function(int index) onTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5,
      shape: const CircularNotchedRectangle(),
      color: AppColors.secondryColor,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(BottomAppBarItemModel.icons.length, (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                  widget.onTapped(_selectedIndex);
                });
              },
              child: BottomAppBarItem(
                  icon: BottomAppBarItemModel.icons[index],
                  title: BottomAppBarItemModel.titles[index],
                  isActive: _selectedIndex == index),
            );
          })),
    );
  }
}
