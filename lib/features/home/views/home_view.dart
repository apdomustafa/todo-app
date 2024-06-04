import 'package:flutter/material.dart';
import 'package:todo_app2/core/helpers/home_model.dart';
import 'package:todo_app2/features/home/views/widgets/add_task.dart';
import 'package:todo_app2/features/home/views/widgets/custom_Bottom_navigation_bar.dart';
import 'package:todo_app2/features/home/views/widgets/custom_floating_action_buttom.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomFloationgActionButton(
          onpressed: () {
            _addTask(context);
          },
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onTapped: getSelectedItem,
        ),
        body: IndexModel.homeWidgets[_currentIndex],
      ),
    );
  }

  void getSelectedItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const BottomSheetContent();
        });
  }
}
