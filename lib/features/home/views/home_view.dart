import 'package:flutter/material.dart';
import 'package:todo_app2/core/helpers/home_model.dart';
import 'package:todo_app2/features/home/views/widgets/custom_Bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTapped: getSelectedItem,
      ),
      body: IndexModel.indexWidgets[_currentIndex],
    );
  }

  void getSelectedItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
